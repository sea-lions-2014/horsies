enable :sessions

get '/' do

  erb :index
end

get '/deck/:id/quiz' do
  @deck = Deck.find(params[:id])
  puts "hi #{@deck.name} asdf"
  @top_card = @deck.cards.shuffle.first
  session[:card_id] = @top_card.id
  puts "hi first card #{session[:card_id]}"

  erb :quiz
end

get '/deck/:id/quiz/correct' do

 erb :correct
end

get '/deck/:id/quiz/incorrect' do

erb :incorrect
end

post '/deck/:id/quiz' do
  puts "hi card on post #{session[:card_id]}"
  @deck = Deck.find(params[:id])
  @top_card = Card.find(session[:card_id])
  puts "hi card on post #{@top_card.answer}"
  puts "hi card on post #{params[:guess]}"
  if params[:guess].downcase == @top_card.answer.downcase
    redirect "/deck/#{params[:id]}/quiz/correct"
  else
    redirect "/deck/#{params[:id]}/quiz/incorrect"
  end
end

get '/deck/:id/quiz/score' do
  @id = params[:id]
  erb :score
end

post '/quit' do

end