Rails.application.routes.draw do
  get '/resume', to: 'home#index'
  root 'home#index'
end
