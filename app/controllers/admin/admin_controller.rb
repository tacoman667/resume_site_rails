class Admin::AdminController < ApplicationController
	layout 'admin'

  before_action :authenticate_admin!

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
  	@section = Section.new
  end

  def create_section
  	@section = Section.new(section_params)
    @section.order = Section.next_order
    
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

  def remove_section
    @section = Section.find params[:id]
    @section.destroy

    Section.reorder_sections

    redirect_to admin_sections_path
  end

  def move_section_up
    section = Section.find params[:id]
    section.move_up
    
    redirect_to admin_sections_path
  end

  def move_section_down
    section = Section.find params[:id]
    section.move_down

    redirect_to admin_sections_path
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
