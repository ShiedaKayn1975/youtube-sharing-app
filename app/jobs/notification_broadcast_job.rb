#app/jobs/notification_broadcast_job.rb
class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(user, notification)
    user.subscriptions.each do |subscription|
      ActionCable.server.broadcast "notification_channel_#{subscription.subscriber_id}", {
        content: notification.content,
        id: notification.id
      }
    end
  end
end