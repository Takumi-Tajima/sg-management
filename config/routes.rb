Rails.application.routes.draw do
  devise_for :users
  resources :daily_reports, only: %i[show] do
    resources :retrospectives, only: %i[show new create edit update destroy], module: :daily_reports
    resources :facts, only: %i[show new create edit update destroy], module: :daily_reports
  end
end
