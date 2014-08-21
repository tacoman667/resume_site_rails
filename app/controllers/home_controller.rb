class HomeController < ApplicationController
  def index

  	@info = PersonalInfo.info
  	@sections = Section.order(:order)

  end
end
