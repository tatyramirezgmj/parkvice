# app/texters/parkvice_texter.rb
class ParviceTexter < Textris::Base
  default :from => ENV["TWILIO_NUMBER"]

  def alert(params)
    @params = params
    text :to = @user.phone_number
  end
end
