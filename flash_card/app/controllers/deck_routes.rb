get '/deck/new' do
  erb :create_deck
end

get '/deck/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards
  erb :deck_view
end

get "/deck/:deck_id/delete" do
  Deck.find(params[:deck_id]).destroy
  redirect "/"
end

post '/deck/create' do
  @name = params[:deck_name]
  @type = "deck"
  @new_deck = Deck.create(name: @name)
  redirect "/deck_got_created"
end

get '/deck_got_created' do
  erb :created_deck
end