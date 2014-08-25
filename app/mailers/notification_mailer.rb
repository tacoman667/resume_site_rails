class NotificationMailer < ActionMailer::Base
  default from: "noreply@#{ENV['DEFAULT_MAIL_HOST']}"

  def pdf_viewed(ip_address)
  	@scraper = IpLookupScraper.new(ip_address)
  	admin = Admin.first
		mail(to: admin.email, subject: 'Someone looked at your resume').deliver
  end
end
