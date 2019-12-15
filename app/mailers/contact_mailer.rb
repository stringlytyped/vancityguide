class ContactMailer < ApplicationMailer
  def notification_email
    @recipient = "vancityguide@jsnyman.com" # This is an alias for my personal email
    @sender_name = params[:sender_name]
    @sender_addr = params[:sender_addr]
    @message = params[:message]
    mail to: @recipient, reply_to: @sender_addr, subject: "New contact form submission from #{@sender_name}"
  end
end
