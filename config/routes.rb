Rails.application.routes.draw do
  root to: "pages#home"
  get '/dates/:date', to: 'forecasts#show', as: 'forecasts'
  resources :surf_spots, only: [:show]
  # resources :scrape_logs
  # resources :spots
  devise_for :users
end
