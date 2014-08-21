Rails.application.routes.draw do
  devise_for :admins

  devise_scope :admin do
    get "logout", to: "devise/sessions#destroy", as: :logout
  end

  namespace :admin do
  	get '/', to: 'admin#index'

  	get 'personal_info', to: 'admin#personal_info', as: :personal_info
  	patch 'personal_info', to: 'admin#update_personal_info'

  	get 'sections', to: 'admin#sections', as: :sections
  	get 'sections/new', to: 'admin#new_section', as: :new_section
  	get 'sections/:id', to: 'admin#section', as: :section
  	post 'sections/new', to: 'admin#create_section'
  	patch 'sections/:id', to: 'admin#update_section'
  end

  get '/resume', to: 'home#index'
  
  root 'home#index'
end
