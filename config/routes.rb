Rails.application.routes.draw do
  get 'update_swell_direction', to: 'surf_conditions#update_swell_direction'
  devise_for :users
  resources :scrape_logs
  resources :spots
  root to: "pages#home"
end
