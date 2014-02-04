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
  @card.decks << deck
  erb :created_card
end
