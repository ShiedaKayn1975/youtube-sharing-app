class VideoSharing < ApplicationRecord
  belongs_to :user

  after_create :create_notification

  def create_notification
    notification = Notification.create(user: user, content: "#{user.name} shared a video.\nTitle: #{title}")
    NotificationBroadcastJob.perform_async(user, notification)
  end
end
