R20130405Posterous::Application.routes.draw do
  root :to => 'home#index'
  resources :posts
end
