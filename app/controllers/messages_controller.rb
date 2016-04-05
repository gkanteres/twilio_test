class MessagesController < ApplicationController
  def new
  end

  def create
    @message = Message.create
    @phone_number = params[:phone_number]
    @body = params[:message]
    response = @message.send_message(@phone_number, @body)
    if response
      redirect_to root_path
    else
      flash[:alert] = 'errors occured while sending your message'
      redirect_to 'new'
    end
  end
end
