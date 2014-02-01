get '/' do

  erb :index
end

get '/deck/andy/quiz' do
  puts "hi andy"
@deck = Deck.where(name: 'Andy').first
@top_card = @deck.cards.first

erb :quiz
end

# get '/deck/:id/quiz' do

# @deck = Deck.find(params[:id])
#   puts "hi #{@deck.name} asdf"
# @top_card = @deck.cards.first
#   puts "hi first card #{@top_card.question}"

# erb :quiz
# end



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
  @deck.card.rotate
end

get '/score' do

end

post '/quit' do

end