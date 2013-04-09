R20130409Satellites::Application.routes.draw do
  root :to => 'home#index'
  resources :planets
end
