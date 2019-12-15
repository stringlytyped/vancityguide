Rails.application.routes.draw do
  devise_for :users

  resources :pois

  get "/contact", to: "contact#new"
  post "/contact", to: "contact#create"

  root to: 'home#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
