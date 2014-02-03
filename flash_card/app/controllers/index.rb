enable :sessions

before '/*' do
  pass if params[:splat] == [""] || params[:splat] == ["unauthorized"] || params[:splat] == ["login"] || params[:splat] == ["create_account"]
  @user = User.where(id: session[:user_id]).first
   if session[:logged_in] == false
      redirect '/unauthorized'
   end
end

get '/' do

  erb:index
end

get '/decks' do
  @decks = Deck.all
  erb :index
end

get '/score' do
  p "triggered"
  @decks = @user.decks
  erb :all_scores
end

post '/login' do
  @user = User.where(params)
  if User.where(params).empty?
    redirect '/unauthorized'
  else
    @user = User.where(params).first
    session[:logged_in] = true
    session[:user_id] = @user.id
    redirect "/#{@user.name}"
  end
end

post '/create_account' do
  User.create(params)
  redirect '/'
end

get '/logout' do
  session[:logged_in] = false
  redirect '/'
end

get '/unauthorized' do
  erb :unauthorized
end

get '/:user_name' do
  erb :user
end
