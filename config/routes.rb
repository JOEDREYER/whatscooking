Rails.application.routes.draw do
  devise_for :users

  resources :scrape_logs
  resources :spots

  root to: "pages#home"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
