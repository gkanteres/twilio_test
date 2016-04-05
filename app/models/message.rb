class Message < ActiveRecord::Base
  before_create :setup_twilio

  def send_message(phone_number, message)
    @client.messages.create(
      from: '+18044466329',
      to: phone_number,
      body: message
    );
  end

private

  def setup_twilio
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_ACCOUNT_TOKEN'])
  end
end
