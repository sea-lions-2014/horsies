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

post '/deck' do
  @name = params[:deck_name]
  @type = "deck"
  @new_deck = Deck.create(name: @name)
  erb :created_deck
end

get '/deck/:deck_id/scores' do
  @deck_id = params[:deck_id]
  @scores = Score.where(deck_id: @deck_id).order("value DESC")
  @users = @scores.select(:user_id).map {|item| User.find(item.user_id)}
  erb :score
end


