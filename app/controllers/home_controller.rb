class HomeController < ApplicationController
  def index

  	@info = PersonalInfo.info
  	@sections = Section.order(:order)

  	respond_to do |f|
  		f.html
  		f.pdf do
        render pdf: "the_resume.pdf",
        	template: "home/index.html",
        	page_size: 'Letter',
        	layout: 'pdf'
        	# show_as_html: params[:debug].present?
      end
  	end
  end
end
