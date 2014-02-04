get '/deck' do
  @user = User.find(session[:user_id])
  @decks = @user.decks.all
  erb :deck
end

get "/deck/:deck_id/delete" do
  Deck.find(params[:deck_id]).destroy
  redirect "/deck"
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

get '/deck/:deck_id/scores' do
  @deck_id = params[:deck_id]
  @scores = Score.where(deck_id: @deck_id).order("value DESC")
  @users = @scores.select(:user_id).map {|item| User.find(item.user_id)}
  erb :leaderboard
end

get '/deck/:deck_id/card/new' do
  @deck_id = params[:deck_id]
  erb :create_card
end

get "/deck/:deck_id/card/:card_id/delete" do
  Card.find(params[:card_id]).destroy
  redirect "/deck/#{params[:deck_id]}"
end

post '/deck/:deck_id/card' do
  deck = Deck.find(@deck_id = params[:deck_id])
  @card = Card.create(question: params[:question], answer: params[:answer])
  @card.add_to_deck!(deck)
  erb :created_card
end

