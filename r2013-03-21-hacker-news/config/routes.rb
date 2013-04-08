R20130321HackerNews::Application.routes.draw do
  root :to => 'home#index'
  post '/scrape' => 'scrape#scrape'
end
