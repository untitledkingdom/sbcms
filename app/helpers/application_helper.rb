module ApplicationHelper
  # :nocov:
  def render_notices
    { error: 'alert-danger', alert: 'alert-warning', notice: 'alert-info' }.flat_map do |type, class_name|
      if flash[type].respond_to?(:each)
        flash[type].map { |text| content_tag(:div, text, class: "alert #{class_name}") }

      elsif flash[type].present?
        content_tag(:div, flash[type], class: "alert #{class_name}")

      end
    end.join.html_safe
  end
  # :nocov:
end
