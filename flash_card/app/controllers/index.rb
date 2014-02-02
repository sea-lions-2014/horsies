enable :sessions

get '/' do
  #login info
end

get '/decks'
  @decks = Deck.all
  erb :index
end

