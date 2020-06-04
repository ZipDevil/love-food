Rails.application.routes.draw do
  get 'home/index'
  resources :clients
  resources :appointments
  get "new_release" => 'appointments#new_release', :as => :new_release
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
