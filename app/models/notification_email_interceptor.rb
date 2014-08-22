class NotificationEmailInterceptor
  def self.delivering_email(message)
    message.perform_deliveries = false
    p "message:\n #{message}"
  end
end