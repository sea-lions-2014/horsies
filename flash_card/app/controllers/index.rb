get '/create_card' do

  erb :create_card
end

post '/created' do
  @question = params[:question]
  @answer = params[:answer]
  @category = params[:category]
  # @new_card = Card.new(@question, @answer, @category)
  erb :created
end