R20130211StockMovie::Application.routes.draw do
  root :to => 'home#home'
  get '/about' => 'home#about'
  get '/faq' => 'home#faq'
  get '/stock/new' => 'stock#new'
  get '/stock/quote' => 'stock#quote'
  get '/movie/new' => 'movie#new'
  get '/movie/poster' => 'movie#poster'
end
