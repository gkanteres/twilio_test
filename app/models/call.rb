class Call < ActiveRecord::Base
  before_create :setup_twilio

  def send_call(phone_number)
    call = @client.calls.create(
      from: '+18044466329',
      to: phone_number,
      url: 'https://gist.githubusercontent.com/patsul12/e6540632d21779b79057b5a1f997fad3/raw/5f9790e5fcc4fd059b1874f59e6d2bab759a6804/gistfile1.txt'
    );

  end

private

  def setup_twilio
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_ACCOUNT_TOKEN'])
  end
end
