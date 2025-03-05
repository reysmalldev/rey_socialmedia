# frozen_string_literal: true

class Components::Nav < Components::Base
    def view_template(&)
      nav(class: "nav", &)
    end

    def brand(href, &)
      a(class: "nav-brand", href:, &)
    end

    def item(props, &)
      a(class: "nav-item #{props[:button] ? 'button' : ''}".strip, **props, &)
    end
end
