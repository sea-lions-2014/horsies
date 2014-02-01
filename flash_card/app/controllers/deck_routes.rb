get '/:user_id/deck' do
  p session
  @decks = @user.decks.all
  erb :deck
end

get "/:user_id/deck/:deck_id/delete" do
  Deck.find(params[:deck_id]).destroy
  redirect "/#{params[:user_id]}/deck"
end

get '/:user_id/deck/new' do
  erb :create_deck
end

get '/:user_id/deck/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards
  erb :deck_view
end

post '/:user_id/deck' do
  @name = params[:deck_name]
  @type = "deck"
  @new_deck = Deck.create(name: @name)
  @user.decks << @new_deck
  erb :created_deck
end
