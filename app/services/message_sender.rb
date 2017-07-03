class MessageSender
  def self.send_messages
    new.send_messages
  end

  def initialize
    @client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
    @phone_numbers = User.all.map(&:phone_number)
  end

  def send_messages
    @phone_numbers.each do |ph|
      @client.messages.create(:from => twilio_number, :to => ph , :body => "This is Parkvice avoiding you a ticket! Parking ticket officer near Wyncode, you can pay here => https://goo.gl/2RLLZc")

    end
  end



  private

  def twilio_number
    twilio_number = '+17864602862'
  end
end
