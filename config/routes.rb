EnumTutor::Application.routes.draw do


  namespace :admin do
    post '/login', :to => 'pages#login'

    resources :challenges
    
    root :to => 'pages#login'
  end

  resources :challenges, :only => [:index, :show] do
    member do
      post :attempt
    end
  end

  get '/signin', :to => 'sessions#sign_in'
  post 'signout', :to => 'sessions#sign_out'
  get '/auth/:provider/callback', :to => 'sessions#auth'

  root :to => 'pages#welcome'  
end
