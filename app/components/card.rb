# frozen_string_literal: true

class Components::Card < Components::Base
  def view_template(&)
    div(class: "card", &)
  end

  def title(&)
    h2(class: "card-title", &)
  end

  def content(&)
    p(class: "card-body", &)
  end
end
