get '/deck/:deck_id/card/new' do
  @deck_id = params[:deck_id]
  erb :create_card
end

get "/deck/:deck_id/card/:card_id/delete" do
  Card.find(params[:card_id]).destroy
  redirect "/deck/#{params[:deck_id]}"
end

post '/deck/:deck_id/card' do
  # I think this would be so much sweeter if you were to remove all these
  # instance variables and INSTEAD created a Card (which should also handle
  # adding itself to a deck) and then you return the @new_card variable to the
  # views.  THAT should have all the knowledge for displaying.

  @question = params[:question]
  @answer = params[:answer]
  @deck_id = params[:deck_id]
  @new_card = Card.create(question: @question, answer: @answer)
  @new_card.decks << Deck.find(params[:deck_id])
  erb :created_card
end
