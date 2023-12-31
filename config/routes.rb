Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "profile", to: "pages#profile"
  get "user_items", to: "pages#user_items"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "pages#home"
  resources :items do
    collection do
      get :top
      get :bottom
      get :shoes
    end
  end
  resources :movements, only: %i[show index]
  post "movements", to: "movements#create", as: :buy
  patch "sold", to: "movements#sold"
end
