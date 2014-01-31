get '/' do

  erb :index
end

get '/deck/:id/quiz' do
@deck = Deck.find(params[:id])
@top_card = @deck.cards.first

erb :quiz
end

get '/deck/:id/quiz/correct' do
 "Correct"
end

get '/deck/:id/quiz/incorrect' do
"Incorrect"
end

post '/deck/:id/quiz' do
  @deck = Deck.find(params[:id])
  @top_card = @deck.cards.first
  if params[:guess].downcase == @top_card.answer.downcase
    redirect "/deck/#{params[:id]}/quiz/correct"
  else
    redirect "/deck/#{params[:id]}/quiz/incorrect"
  end
end

get '/score' do

end

post '/quit' do

end