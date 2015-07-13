class HomeController < ApplicationController
  def index

  	@info = PersonalInfo.info
  	@sections = Section.order(:order)

  	respond_to do |f|
  		f.html
  		f.pdf do
        if ENV['should_send_emails'] == 'yes'
          ip = request.remote_ip
          NotificationMailer.pdf_viewed(ip).deliver
        end

        render pdf: "the_resume.pdf",
        	template: "home/index.html",
        	page_size: 'Letter',
        	layout: 'pdf'
        	# show_as_html: params[:debug].present?
      end
  	end
  end
end
