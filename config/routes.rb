EnumTutor::Application.routes.draw do

  root :to => 'pages#welcome'

  namespace :admin do
    get '/', :to => 'pages#home'
    post '/login', :to => 'pages#login'

    resources :challenges, :only => [:new, :create, :edit, :update, :destroy]
  end

  resources :challenges, :only => [:show, :index] do
    member do
      post :attempt
    end
  end
  
end
