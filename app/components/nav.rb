# frozen_string_literal: true

class Components::Nav < Components::Base
  include Phlex::Rails::Helpers::ButtonTo
  def view_template(&)
    nav(class: "nav", &)
  end

  def brand(href, &)
    a(class: "nav-brand", href:, &)
  end

  def item(props, &)
    a(class: "nav-item #{props[:button] ? 'button' : ''}".strip, **props, &)
  end

  def item_icon(text: nil, icon: nil, method: nil, href: nil, **props, &)
    if !method
      a(href: href, class: "nav-item w-full m-0".strip, **props) do
        p(class: "text-white") { text } if text
        i(data_lucide: icon, class: "text-white w-full h-full")
      end
    else
      button_to(**props, method: method, class: "nav-item".strip, ) do
        p(class: "text-white") { text } if text
        i(data_lucide: icon, class: "text-white w-50")
      end
    end
  end
end
