get '/' do

  erb :index
end

get '/deck/:id/quiz' do
@deck = Deck.find(params[:id])
@top_card = @deck.cards.first

erb :quiz
end

get '/deck/:id/quiz/correct' do

end

get '/deck/:id/quiz/incorrect' do

end

post '/deck/:id/quiz' do

end

get '/score' do

end

post '/quit' do

end