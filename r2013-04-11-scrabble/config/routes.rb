R20130411Scrabble::Application.routes.draw do
  root :to => 'home#index'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  post '/channel' => 'channels#create'
  get '/refresh' => 'channels#refresh'
  post '/send_chat' => 'games#send_chat'
  post '/start_game' => 'games#start_game'
  get '/refresh_players/:channel' => 'games#refresh_players'
  post '/transmit_letter' => 'games#transmit_letter'
  post '/next_player' => 'games#next_player'
  post '/grab_letters' => 'games#grab_letters'
end
