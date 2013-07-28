get '/users/new' do
  # Display sign-up/sign-in page
  erb :sign_up
end

post '/users/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    self.current_user = User.find_by_email(params[:email])
    redirect "/users/#{current_user.type.downcase}s/profile"
  else
    @message = "Email/Password combination is invalid."
    erb :index
  end
end

get '/users/logout' do
  logout
  redirect '/'
end

