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
    delete 'sections/remove/:id', to: 'admin#remove_section', as: :remove_section
    patch 'sections/move_up/:id', to: 'admin#move_section_up', as: :move_section_up
    patch 'sections/move_down/:id', to: 'admin#move_section_down', as: :move_section_down
  	post 'sections/new', to: 'admin#create_section'
  	get 'sections/:id', to: 'admin#section', as: :section
    patch 'sections/:id', to: 'admin#update_section'

    post 'send_emails', to: 'admin#send_emails'
  end

  get '/resume', to: 'home#index'
  
  root 'home#index'
end
