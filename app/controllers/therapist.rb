post '/therapist' do 
  if (params[:secret_password] == 'happyending')
    therapist = Therapist.create(email:         params[:email],
                            password_hash: params[:password_hash],
                            first_name:    params[:first_name],
                            last_name:     params[:last_name],
                            phone:         params[:phone])
    therapist.password = params[:password_hash]
    therapist.save
    self.current_user = therapist
    redirect '/therapist/appointments'
  else
    erb :signup #Print out errors
  end
end

get '/therapist/appointments' do
  erb :therapist_profile
  # @appointments = Appointment.where(therapist_id: )

end

get '/therapist/test' do
  erb :therapist_create_appointments
end

post '/therapist/test' do
  puts ">---- PARAMS ----------------------------------------------------->"
  puts params
  puts "<---- PARAMS -----------------------------------------------------<"

  erb :therapist_create_appointments
end
