R20130215Pinterest::Application.routes.draw do
  root :to => 'home#index'
  get '/pinterest' => 'pinterest#show'
end
