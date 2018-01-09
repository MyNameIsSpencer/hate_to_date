Rails.application.routes.draw do
  resource :users, except: [:index] do
    resources :results, only: [:index, :show, :create]
  end
  resources :surveys, only: [:index, :show]
  resource :session, only: [:new, :create, :destroy]

  root "surveys#index"
end
