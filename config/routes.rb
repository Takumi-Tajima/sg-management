Rails.application.routes.draw do
  devise_for :users
  resources :daily_reports, only: %i[show] do
    resources :facts, only: %i[show new create edit update destroy], module: :daily_reports do
      resources :messages, only: %i[new create], module: :facts
      resource :retrospective, module: :facts
    end
  end
end
