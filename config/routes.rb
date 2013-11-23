EnumTutor::Application.routes.draw do


  namespace :admin do
    post '/login', :to => 'base#create_admin_session'

    resources :challenges
    
    root :to => 'base#new_admin_session'
  end

  resources :challenges, :only => [:index, :show] do
    member do
      post :attempt
    end
  end

  get '/signin', :to => 'sessions#sign_in'
  get 'signout', :to => 'sessions#sign_out'
  get '/auth/:provider/callback', :to => 'sessions#auth'

  root :to => 'pages#welcome'  
end
