post '/patient' do
  @patient = Patient.new(email: params[:email],
              password: params[:password],
              first_name: params[:first_name],
              phone: params[:phone],
              last_name: params[:last_name])
  if @patient
    @patient.password = params[:password]
    @patient.save
    self.current_user = @patient
    redirect '/user/profile' #-- displays patient profile with appointment, medical information, book etc.
  else
    @patient
    erb :signup
  end
end



get '/user/profile' do
  erb :user_profile
end