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

get '/therapist/test' do
  erb :therapist_create_appointments
end

post '/therapist/test' do
  if params  
    params["apt"]["starttime"].each do |apt_time|
      Appointment.create(appt_at: apt_time.last)
    end
  end
  redirect '/'
end

