class Admin::AdminController < ApplicationController
	layout 'admin'

  def index

  end

  def personal_info
  	@info = PersonalInfo.info
  end

  def sections
  	
  end

  def update_personal_info
  	info = PersonalInfo.info
  	if info.update(personal_info_params)
  		flash[:notice] = "Successfully updated personal info"
  	else
  		flash[:alert] = "Failed to update personal info"
  	end

  	redirect_to action: :personal_info
  end

  private

  def personal_info_params
  	params.require(:personal_info).permit(
  		:name,
  		:city,
  		:state,
  		:zipcode,
  		:email
  	)
  end

end
