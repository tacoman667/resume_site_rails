
ActionMailer::Base.register_interceptor(NotificationEmailInterceptor) if Rails.env.development?