Rails.application.routes.draw do
  root 'daily_reports#index'
  devise_for :users
  resources :daily_reports, only: %i[index show create] do
    resources :tasks, only: %i[new create], module: :daily_reports
    resources :facts, only: %i[show new create edit update destroy], module: :daily_reports do
      resources :messages, only: %i[new create], module: :facts
      resource :retrospective, module: :facts
    end
  end
end
