enable :sessions

get '/' do
  @decks = Deck.all
  erb :index
end


