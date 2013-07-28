get '/users/new' do
  # Display sign-up/sign-in page
  erb :signup
end

post '/users/login' do
@user = User.find_by_email(params[:email])
  if @user
    if @user.password == params[:password]
      if params[:type] == 'Patient'
        self.current_user = Patient.find_by_email(params[:email])
        redirect '/users/patients/profile'
      elsif params[:type] == "Therapist"
        self.current_user = Therapist.find_by_email(params[:email])
        redirect '/users/therapists/profile'
      elsif params[:user_type] == "Admin"
        self.current_user = Admin.find_by_email(params[:email])
        redirect '/users/profile'
      end 
    else
      @message = "Invalid password"
      erb :signup
    end
  else
    @message = "User not found"
    erb :signup
  end
end

get '/users/logout' do
  logout
  redirect '/'
end

