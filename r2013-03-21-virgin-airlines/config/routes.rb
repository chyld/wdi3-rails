R20130321VirginAirlines::Application.routes.draw do
  root :to => 'home#index'
  resources :users, :only => [:new, :create]
  resources :session, :only => [:new, :create, :destroy]
  resources :airplanes, :only => [:index, :new, :create]
  resources :flights, :only => [:index, :new, :create, :show] do
    member do
      post :purchase
    end

    collection do
      get :search
      get :filter
    end
  end
end
