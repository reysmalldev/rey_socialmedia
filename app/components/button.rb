# frozen_string_literal: true

class Components::Button < Components::Base
  include Phlex::Rails::Helpers::ButtonTo
  def initialize(props)
    @props = props
  end

  def view_template(&)
    button_to(@props[:name], @props[:url], **@props, class: "button", &)
  end
end
