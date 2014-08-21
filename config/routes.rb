Rails.application.routes.draw do
  namespace :admin do
  	get '/', to: 'admin#index'

  	get 'personal_info', to: 'admin#personal_info', as: :personal_info
  	patch 'personal_info', to: 'admin#update_personal_info'

  	get 'sections', to: 'admin#sections', as: :sections
  	get 'sections/:id', to: 'admin#section', as: :section
  	patch 'sections/:id', to: 'admin#update_section'
  end

  get '/resume', to: 'home#index'
  root 'home#index'
end
