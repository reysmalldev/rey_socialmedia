# frozen_string_literal: true

class Components::Input < Components::Base
  def view_template(&)
    div(class: "group bg-gray-800 h-12 border border-gray-600 rounded-xl px-4 flex items-center gap-2 focus-within:border-gray-100 data-[error=true]:border-danger my-5", &)
  end

  def icon(data_lucide, &)
    span(class: "text-gray-400 group-focus-within:text-gray-100 group-[&:not(:has(input:placeholder-shown))]:text-gray-100 group-data-[error=true]:text-danger") { i(data_lucide: data_lucide).freeze }
  end

  def field(props, &)
    input(class: "flex-1 outline-0 placeholder-gray-400", **props, &)
  end
end

