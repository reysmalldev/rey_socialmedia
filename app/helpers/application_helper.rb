module ApplicationHelper
  def date_handler(date)
    if date.present?
        distance = ActiveSupport::Duration.build((Time.now - date.time).to_i).parts

        unit = distance.map { |k, _| k }[0]

        text = "#{distance[unit]} #{distance[unit].to_i == 1 ? unit[0...-1] : unit}"
        puts "o text"
        puts text
        text
    end
  end
end
