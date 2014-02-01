enable :sessions

before '/:user_id/*' do
  @user = User.find(id: session[:user_id])
   if session[:logged_in] == false
    redirect '/unauthorized'
   end
end

get '/' do
  erb :index
end

post '/login' do
  @user = User.where(params)
  if User.where(params).empty?
    erb :index
  else
    @user = User.where(params).first
    session[:logged_in] = true
    session[:user_id] = @user.id
    @user = @users.first
    redirect "/#{@user.id}/deck"
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

get '/:user_id' do
  @user = User.find(params[:user_id])
  erb :user
end

