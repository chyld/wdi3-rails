R20130218Tunr::Application.routes.draw do
  root :to => 'home#index'

  resources :users, :except => [:edit] do
    collection do
      get 'edit'
    end
  end

  resources :songs do
    member do
      get 'cart'
      post 'purchase'
      post 'refund'
    end
  end

  resources :albums do
    member do
      post 'purchase'
    end
  end

  resources :genres, :artists, :mixtapes

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
