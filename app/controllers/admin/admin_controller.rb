class Admin::AdminController < ApplicationController
	layout 'admin'

  def index

  end

  def personal_info
  	@info = PersonalInfo.info
  end

  def sections
  	@sections = Section.order(:order)
  end

  def section
  	@section = Section.find params[:id]
  end

  def new_section
  	@section = Section.new(order: Section.next_order)
  end

  def create_section
  	@section = Section.new(section_params)

  	if @section.save
  		flash[:notice] = "Successfully created #{@section.name} section"
  		redirect_to action: :sections
  	else
  		flash[:alert] = @section.errors.full_messages.join('<br/>').html_safe
  		render :new_section
  	end
  end

  def update_section
  	@section = Section.find params[:id]
		
  	if @section.update(section_params)
  		flash[:notice] = "Successfully updated #{@section.name} section"
  		redirect_to action: :sections
  	else
  		flash[:alert] = @section.errors.full_messages.join('<br/>').html_safe
  		render :section
  	end
  end

  def update_personal_info
  	@info = PersonalInfo.info

  	if @info.update(personal_info_params)
  		flash[:notice] = "Successfully updated personal info"
  		redirect_to action: :personal_info
  	else
  		flash[:alert] = @info.errors.full_messages.join('<br/>').html_safe
  		render :personal_info
  	end
  end

  private

  def section_params
  	params.require(:section).permit(
  		:name,
  		:description,
  		:order
  	)
  end

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
