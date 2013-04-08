R20130325Numb3rs::Application.routes.draw do
  root :to => 'home#index'
  get '/length' => 'home#length'
  get '/data' => 'home#data'
end
