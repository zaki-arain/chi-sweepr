get '/sessions/new' do
  erb :'session/new'
end

post '/sessions' do
  email = params[:user][:email]
  password_text = params[:user][:password]

  @user = User.authenticate(email, password_text)
  if @user
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = true
    erb :'session/new'
  end
end


get "/sessions/logout" do
  session[:user_id] = nil
  redirect '/'
end
