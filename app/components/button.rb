# frozen_string_literal: true

class Components::Button < Components::Base
  include Phlex::Rails::Helpers::ButtonTo
  include Phlex::Rails::Helpers::LinkTo

  def initialize(url = nil, text: nil, icon: nil, icon_fill: nil, **props)
    @icon = icon
    @text = text
    @props = props
    @url = url
    @icon_fill = icon_fill
  end

  def view_template(&)
    button_to(@url, class: "button", **@props) do
      icon(@icon)                      if @icon
      p(class: "text-white") { @text } if @text
    end
  end

  def icon(name)
    i(data_lucide: name, class: "text-white #{@icon_fill ? @icon_fill : ""}".strip)
  end
end
