Rails.application.routes.draw do
  resource :users, except: [:index] do
    resources :results, only: [:index, :show]
  end
  resources :surveys, only: [:index, :show]
  resource :session, only: [:new, :create, :destroy]
end
