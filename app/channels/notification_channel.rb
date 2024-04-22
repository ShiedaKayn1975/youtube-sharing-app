class NotificationChannel < ApplicationCable::Channel
  before_subscribe :find_current_user

  def subscribed
    stream_from "notification_channel_#{@current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private

  def find_current_user
    @current_user = User.find_by_id(params[:user])
  end
end
