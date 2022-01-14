Rails.application.routes.draw do
  health_check_routes

  namespace :v1, defaults: { format: :json } do
    resources :mutants, only: :create
    resources :stats, only: :index
  end
end
