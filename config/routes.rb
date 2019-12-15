Rails.application.routes.draw do
  resources :pois
  resources :bookmarks, only: [:index, :create, :show, :destroy]

  get "/contact", to: "contact#new"
  post "/contact", to: "contact#create"

  devise_for :users

  root to: 'home#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
