Rails.application.routes.draw do
  root to: "pages#home"
  get 'update_swell_direction', to: 'surf_conditions#update_swell_direction'
  devise_for :users
  resources :scrape_logs
  resources :spots
end
