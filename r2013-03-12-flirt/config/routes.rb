R20130312Flirt::Application.routes.draw do
  root :to => 'home#index'

  resources :subscribers, :only => [:new, :create] do
    collection do
      post :purchase
    end
  end

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
