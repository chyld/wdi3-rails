R20130411Scrabble::Application.routes.draw do
  root :to => 'home#index'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  post '/channel' => 'channels#create'
  get '/refresh' => 'channels#refresh'
end
