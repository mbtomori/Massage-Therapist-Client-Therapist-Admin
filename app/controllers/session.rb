get '/users/new' do
  # Display sign-up/sign-in page
  erb :sign_up
end

post '/users/login' do
  puts "|#{params[:email]}|"
  puts "|#{params[:password]}|"
  @user = User.authenticate(params[:email], params[:password])
  puts @user ? "Exists" : "Never Made Me!"
  if @user
    puts "USER EXISTS"
    @user.type == 'Therapist'
    if @user.type == 'Patient'
      self.current_user = Patient.find_by_email(params[:email])
      redirect '/users/patients/profile'
    elsif @user.type == 'Therapist'
      self.current_user = Therapist.find_by_email(params[:email])
      redirect '/users/therapists/profile'
    elsif @user.type == 'Admin'
      self.current_user = Admin.find_by_email(params[:email])
      redirect '/users/profile'
    end 
  else
    @message = "Email/Password combination is invalid."
    erb :index
  end
end

get '/users/logout' do
  logout
  redirect '/'
end

