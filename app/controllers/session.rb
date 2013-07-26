get '/sessions/new' do
  # Display sign-up/sign-in page
  if session[:id]
    redirect 'user/profile'
  else
    erb :signup
  end
end

post '/sessions' do
  @user = User.find_by_email(params[:email])

  if @user
    if @user.password == params[:password]
      self.current_user = @user
      redirect to('/')
    else
      @message = "Invalid password"
      erb :signup
    end
  else
    @message = "User not found"
    erb :signup
  end
end

get '/sessions/logout' do
  logout
  redirect '/'
end

