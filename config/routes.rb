P5::Application.routes.draw do

#user management
  match 'signup' => 'users#new', :as => :signup
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login
  match 'user/edit' => 'users#edit', :as => :edit_current_user
  resources :sessions, :only => [:create]
  resources :users, :except => [:new]
  
#Exercises    
  get "calendars/index"
  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar,  :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  
  resources :events
  resources :exercises
  
  
  match 'Home' => 'sessions#index', :as => :Home
  root :to => "sessions#index"
  
end

