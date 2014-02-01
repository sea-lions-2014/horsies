get '/:user_id/deck/:deck_id/card/new' do
  @deck_id = params[:deck_id]
  erb :create_card
end

get "/:user_id/deck/:deck_id/:card_id/delete" do
  Card.find(params[:card_id]).destroy
  redirect "/#{params[:user_id]}/deck/#{params[:deck_id]}"
end

post '/:user_id/deck/:deck_id/card' do
  @question = params[:question]
  @answer = params[:answer]
  @deck_id = params[:deck_id]
  @new_card = Card.create(question: @question, answer: @answer)
  @new_card.decks << Deck.find(params[:deck_id])
  erb :created_card
end
