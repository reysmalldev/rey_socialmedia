# frozen_string_literal: true

class Components::Input < Components::Base
  def initialize(form: nil)
    @form = form
  end

  def view_template(&)
    div(class: "group bg-gray-800 min-h-12 border border-gray-600 rounded-xl px-4 flex items-center gap-2 focus-within:border-gray-100 data-[error=true]:border-danger my-5", &)
  end

  def icon(data_lucide, &)
    span(class: "text-gray-400 group-focus-within:text-gray-100 group-[&:not(:has(input:placeholder-shown))]:text-gray-100 group-data-[error=true]:text-danger") { i(data_lucide: data_lucide).freeze }
  end

  def area(props, &)
    @form ? @form.text_area(class: "flex-1 outline-0 placeholder-gray-400 text-white", **props, &) : textarea(class: "flex-1 outline-0 placeholder-gray-400 text-white", **props, &)
  end

  def field(props, &)
    if @form
      case props&.[](:field)&.to_sym
      when :password
        @form.password(props[:name], class: "flex-1 outline-0 placeholder-gray-400 text-white py-2", **props.except(:name), &)
      when :email
        @form.email_field(props[:name], class: "flex-1 outline-0 placeholder-gray-400 text-white py-2", **props.except(:name), &)
      when :file
        @form.file_field(props[:name], class: "flex-1 outline-0 placeholder-gray-400 text-white py-2", **props.except(:name, :type), &)
      else
        @form.text_field(props[:name], class: "flex-1 outline-0 placeholder-gray-400 text-white py-2", **props.except(:name), &)
      end
    else
      input(class: "flex-1 outline-0 placeholder-gray-400 text-white py-2", **props, &)
    end
  end
end

