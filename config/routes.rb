Rails.application.routes.draw do
  get 'login' => 'sessions#new', :as => :login
  delete 'logout' => 'sessions#destroy', :as => :logout

  resource :users, except: [:index] do
    resources :results, only: [:index, :show, :create]
  end
  resources :surveys, only: [:index, :show]
  resource :session, only: [:new, :create, :destroy]

  get '/spencers' => 'users#get_users'

  root "surveys#index"
  resources :surveys, only: [:show] do
    get '/load_pictures' => 'questions#load_pictures', :as =>   :load_pictures
  end
end
