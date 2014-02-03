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
  @num += 1
  @score = Score.create(user_id: @user.id, deck_id: params[:id].to_i, value: 0) if @num == 1 # create a new score on the first question
  session[:score] = 0 if params[:num].to_i == 0 #set session score value to zero if on the first question
  @score = Score.where(user_id: @user.id, deck_id: params[:id].to_i).last # find the score object if you're not on the first question
  @top_card = Card.find(session[:card_id])
  @correct = params[:guess].downcase == @top_card.answer.downcase ? true : false
  session[:score] += 1 if @correct # add one to score if correct
  @score.update_attributes(value: session[:score])

  if params[:num].to_i == @deck.cards.length - 1 # if last question
    erb :user_score # show score
  else
    erb :quiz_feedback # or show feedback
  end
end
