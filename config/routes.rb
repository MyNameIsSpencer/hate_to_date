Rails.application.routes.draw do
  get 'login' => 'sessions#new', :as => :login
  delete 'logout' => 'sessions#destroy', :as => :logout

  resource :users, except: [:index] do
    resources :results, only: [:index, :show, :create]
  end
  resources :surveys, only: [:index, :show]
  resource :session, only: [:new, :create, :destroy]

  root "surveys#index"
  get '/load_pictures' => 'surveys#load_pictures', :as => :load_pictures
end
