Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#show'
  get 'home', to: 'home#show'
  get 'login', to: 'sessions#new'

  resource :sessions, only: :create


  resource :service_validation, only: :show

end
