enable :sessions

get '/' do
  @decks = Deck.all
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

get '/deck/new' do
  erb :create_deck
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

get "/deck/:deck_id/delete" do
  Deck.find(params[:deck_id]).destroy
  redirect "/"
end

get "/deck/:deck_id/:card_id/delete" do
  Deck.find(params[:deck_id]).cards.find(params[:card_id]).destroy
  redirect "/deck/#{params[:deck_id]}"
end

post '/deck/:deck_id/card/create' do
  @question = params[:question]
  @answer = params[:answer]
  @category = params[:category]
  @deck_id = params[:deck_id]
  @type = "card"
  @new_card = Card.create(question: @question, answer: @answer, category: @category)
  @new_card.decks << Deck.find(params[:deck_id])
  redirect "/deck/#{params[:deck_id]}/card/created"
end

post '/deck/create' do
  @name = params[:deck_name]
  @type = "deck"
  @new_deck = Deck.create(name: @name)
  redirect "/deck_got_created"
end

get '/deck/:deck_id/card/created' do
  @deck_id = params[:deck_id]
  erb :created_card
end

get '/deck_got_created' do
  erb :created_deck
end

get '/deck/andy/quiz' do
  puts "hi andy"
  @deck = Deck.where(name: 'Andy').first
  @top_card = @deck.cards.first

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
