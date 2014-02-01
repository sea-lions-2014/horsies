get '/' do
  @decks = Deck.all
  erb :index
end

get '/deck/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards
  erb :deck_view
end

get '/deck/:deck_id/card/new' do
  @deck_id = params[:deck_id]
  erb :create_card
end

get '/deck/new' do
  erb :create_deck
end

post '/deck/:deck_id/card/create' do
  @question = params[:question]
  @answer = params[:answer]
  @category = params[:category]
  @deck_id = params[:deck_id]
  @type = "card"
  @new_card = Card.create(question: @question, answer: @answer, category: @category)
  @new_card.decks << Deck.find(params[:deck_id])
  redirect '/card_got_created'
end

post '/deck/create' do
  @name = params[:deck_name]
  @type = "deck"
  @new_deck = Deck.create(name: @name)
  redirect '/deck_got_created'
end

get '/card_got_created' do
  erb :created_card
end

get '/deck_got_created' do
  erb :created_deck
end

