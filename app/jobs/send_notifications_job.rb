class SendNotificationsJob < ApplicationJob
  queue_as :default
  def perform(shoe)
    UserMailer.send_notification_mail(shoe).deliver_now
  end
end
