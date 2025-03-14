# frozen_string_literal: true

class Components::UserPreview < Components::Base
  def initialize(without_bg: false, without_padding: false, selfi: 'auto', font_size: '3xl', border: nil)
    @without_padding = without_padding
    @without_bg = without_bg
    @selfi = selfi
    @font_size = font_size
    @border = border
  end

  def view_template(&)
    classes = "flex items-center text-white rounded-xl w-full h-full text-white rounded-xl"

    unless @without_padding
      classes += ' py-1 px-2'
    end

    unless @without_bg
      classes += ' bg-post-wrapper'
    end

    classes += " #{@border}" if @border
    classes += " #{@selfi}" if @selfi

    div(class: classes, &)
  end

  def text(&)
    @is_created = true
    h4(class: "text-#{@font_size} text-center h-fit", &)
  end

  def avatar(avatar, circle_size: '2xl', size: 20, &)
    classes = 'flex items-center justify-center text-wrap relative rounded-full overflow-hidden'

    case circle_size
    when 'md'
      classes += ' w-[30px] h-[30px] '
    when 'xl'
      classes += ' w-[50px] h-[50px] '
    else
      classes += ' w-[75px] h-[75px] '
    end

    if @is_created
      classes += ' ms-2'
    else
      classes += ' me-2'
    end

    classes += ' border border-stone-50 p-2' unless avatar&.attached?

    div(class: classes.strip) do
      if avatar&.attached?
        img(class: "absolute", src: url_for(avatar.blob))
      else
        i(class: "m-0 -mt-2 size-50", data: {lucide: "user-round-x"})
      end
    end
  end
end
