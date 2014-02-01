get '/deck' do
  @decks = @user.decks.all
  erb :deck
end

get "/deck/:deck_id/delete" do
  Deck.find(params[:deck_id]).destroy
  redirect "/#{params[:user_id]}/deck"
end

get '/deck/new' do
  erb :create_deck
end

get '/deck/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards
  erb :deck_view
end

post '/deck' do
  @name = params[:deck_name]
  @type = "deck"
  @new_deck = Deck.create(name: @name)
  @user.decks << @new_deck
  erb :created_deck
end
