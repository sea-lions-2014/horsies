get '/deck' do
  @user = User.find(session[:user_id])
  @decks = @user.decks.all
  erb :deck
end

get '/deckscores' do
  @user = User.find(session[:user_id])
  @decks = @user.decks.all # Potential for N+1 query bug.  See NOTES.md
  #@decks = @user.decks.includes(:scores).all # N+1 safe
  erb :deckscores
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
  # Unused?  Don't leave things in you don't use
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


