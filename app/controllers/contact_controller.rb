class ContactController < ApplicationController
  # GET /contact
  # Show contact form
  def new
  end

  # POST /contact
  # Accept form data and send notification email
  def create
    @sender_name = params[:sender_name]
    @sender_addr = params[:sender_addr]
    @message = params[:message]

    if (@sender_name.present? && @sender_addr.present? && @message.present?)
      ContactMailer.with(params).notification_email.deliver_now
      redirect_to root_path, notice: "Message sent successfully"
    else
      flash[:alert] = "All fields are required"
      render :new
    end
  end
end
