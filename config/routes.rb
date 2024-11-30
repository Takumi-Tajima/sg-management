Rails.application.routes.draw do
  devise_for :users
  resources :daily_reports, only: %i[show]
end
