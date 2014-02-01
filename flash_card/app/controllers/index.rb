enable :sessions

before '/:user_id/*' do
  @user = User.find(params[:user_id])
   if session[:logged_in] == false
    redirect '/unauthorized'
   end
end

get '/' do
  erb :index
end

post '/login' do
  if User.where(params).empty?
    erb :index
  else
    session[:logged_in] = true
    @user = User.where(params).first
    redirect "/#{@user.id}/deck"
  end
end

post '/create_account' do
  p params
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

