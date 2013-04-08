R20130308Tradr::Application.routes.draw do
  root :to => 'home#index'
  resources :users, :only => [:index, :new, :create]
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  resources :stocks, :only => [:index, :new, :create] do
    collection do
      get :quotes
    end
  end
end
