class MessageMailer < ActionMailer::Base
  default from: ENV['MAILJET_SENDER']

  def send_feedback(user_email, message)
    mail to: ENV['ADMIN_MAIL'], subject: "Feedback (#{user_email})", body: message
  end

  # def send_feedback(user_email, message)
  #   mail(to: ENV['ADMIN_MAIL'], subject: "Feedback (#{user_email})") do |format|
  #     format.text { render plain: message }
  #     format.html { render html: "<p>#{message}</p>".html_safe }
  #   end
  # end
end
