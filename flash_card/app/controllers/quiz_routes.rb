get '/deck/:id/quiz/score' do
  @score = Score.where(user_id: @user.id, deck_id: params[:id].to_i).first
  @id = params[:id]
  erb :user_score
end

before '/deck/:id/quiz/:num' do
  @deck = Deck.find(params[:id])
  @num = params[:num].to_i
end

get '/deck/:id/quiz/:num' do
  @top_card = @deck.cards[@num]
  session[:card_id] = @top_card.id
  erb :quiz
end

post '/deck/:id/quiz/:num' do
  @correct = @deck.track_guess(params[:guess], @user, session[:card_id])

  if @deck.last_question?(params[:num].to_i )
    erb :user_score
  else
    erb :quiz_feedback
  end
end
