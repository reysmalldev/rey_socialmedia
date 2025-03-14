# frozen_string_literal: true

class Components::Card < Components::Base
  include Phlex::Rails::Helpers::ButtonTo
  def initialize(href: nil, target: nil, method: nil)
    @href = href
    @target = target
    @method = method
  end

  def view_template(&)

    @href ? button_to(@href, class: "card", method: @method || :post, &) : div(class: "card", &)
    # @href ? a(class: "card", href: @href, data: {turbo_frame: @target}, &) : div(class: "card", &)
  end

  def author_mark

  end

  def title(size: '2xl', &)
    h2(class: "card-title text-#{size}", &)
  end

  def content(size: 'lg', &)
    p(class: "card-body text-#{size}", &)
  end
end
