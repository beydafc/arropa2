Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "profile", to: "pages#profile"
  get "user_items", to: "pages#user_items"

  get "up" => "rails/health#show", as: :rails_health_check

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
