##
# Actions to power the contact page
class ContactController < ApplicationController
  before_action :set_t_scope

  ##
  # Shows the contact form
  # GET /contact
  def new
  end

  ##
  # Accepts form data and sends notification email
  # POST /contact
  def create
    @sender_name = params[:sender_name]
    @sender_addr = params[:sender_addr]
    @message = params[:message]

    if (@sender_name.present? && @sender_addr.present? && @message.present?)
      ContactMailer.with(params).notification_email.deliver_now
      redirect_to root_path, notice: t('success', scope: @t_scope)
    else
      flash[:alert] = t('error', scope: @t_scope)
      render :new
    end
  end

  private

    ##
    # Sets the translation scope to be used by the t() helper
    def set_t_scope
      @t_scope = :contact
    end
end
