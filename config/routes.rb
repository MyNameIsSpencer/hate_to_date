Rails.application.routes.draw do
  get 'login' => 'sessions#new', :as => :login
  delete 'logout' => 'sessions#destroy', :as => :logout

  resources :users, except: [:index] do
    resources :results, only: [:index, :show, :create]
  end
  get 'users/:id/matches' => 'users#load_matches', :as => :user_matches
  resources :surveys, only: [:index, :show]
  resource :session, only: [:new, :create, :destroy]

  root "sessions#new"
  resources :surveys, only: [:show] do
    get '/load_pictures' => 'questions#load_pictures', :as =>   :load_pictures
  end
  get 'find_event' => 'messages#find_event', :as => :find_event
end
