class CallsController < ApplicationController
  def create
    @call = Call.create
    @phone_number = params[:phone_number]
    response = @call.send_call(@phone_number)
    if response
      redirect_to root_path
    else
      flash[:alert] = 'errors occured while making your call'
      redirect_to 'new'
    end
  end

  def connect
    response = Twilio::TwiML::Response.new do |r|
      r.Say "Help, please, my name is Alice, I'm stuck in this phone.", voice: 'alice'
    end
    render text: response.text
  end
end
