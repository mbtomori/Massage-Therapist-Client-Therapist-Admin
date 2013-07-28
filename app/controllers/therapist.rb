post '/users/therapists/new' do 
  if (params[:secret_password] == 'happyending')
    therapist = Therapist.create(email:         params[:email],
                            password_hash: params[:password_hash],
                            first_name:    params[:first_name],
                            last_name:     params[:last_name],
                            phone:         params[:phone])
    therapist.password = params[:password_hash]
    therapist.save
    self.current_user = therapist
    redirect '/users/therapists/profile'
  else
    erb :sign_up #Print out errors
  end
end

get '/users/therapists/profile' do
  erb :therapist_profile
end

delete '/users/therapists/profile/:appt_id' do
  Appointment.find(params[:appt_id]).destroy
end
