Rails.application.routes.draw do
  root to: "pages#home"
  get '/spots/:date', to: 'spots#show', as: 'surf_spots'
  # resources :surf_spots, only: [:show]
  # resources :scrape_logs
  # resources :spots
  devise_for :users
end
