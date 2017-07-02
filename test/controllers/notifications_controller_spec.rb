require 'rails_helper'

RSpec.describe NotificationsController do
  befor(:each) do
    Textris::Base.deliveries.clear
  end

  descrive '#index' do
    it 'send a notification' do
      expect(MessageSender).to receive(:send_message).once
      post :create, message: 'message'

      expect(Textris::Base.deliveries.count).to be(1)
      expect(response).to redirect_to(root_url)
    end
  end
end
