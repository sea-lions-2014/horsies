get '/deck/:id/quiz' do
  @deck = Deck.find(params[:id])
  @top_card = @deck.cards.shuffle.first
  session[:card_id] = @top_card.id
  erb :quiz
end

post '/deck/:id/quiz' do
  @deck = Deck.find(params[:id])
  @top_card = Card.find(session[:card_id])
  @correct = params[:guess].downcase == @top_card.answer.downcase ? true : false
  erb :quiz_feedback
end

get '/deck/:id/quiz/score' do
  @id = params[:id]
  erb :score
end

post '/quit' do
end