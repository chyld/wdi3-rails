R20130228Todo::Application.routes.draw do
  root :to => 'home#index'
  resources :users, :only => [:index, :new, :create]
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  resources :tasks, :only => [:index, :show, :create, :update, :destroy] do
    member do
      put :complete
    end
  end
  resources :priorities, :only => [:index, :create, :update] do
    member do
      post :up
      post :down
    end
  end
end
