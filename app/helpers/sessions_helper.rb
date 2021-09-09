module SessionsHelper
  def flash_alert
    content_tag :p, flash[:alert], class: 'flash alert' if flash[:alert]
  end
end
