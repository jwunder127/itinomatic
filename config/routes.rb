Rails.application.routes.draw do
  get 'users/Destinations'
  get 'users/Photos'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#index", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  resources :users do
    resources :trips do
      resources :destinations
      resources :photos
    end
  end

end
