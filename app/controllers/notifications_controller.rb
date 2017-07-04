# app/controllers/notifications_controller.rb
class NotificationsController < ApplicationController
  def create
    MessageSender.send_messages
    redirect_to dashbord_path
  end
end
