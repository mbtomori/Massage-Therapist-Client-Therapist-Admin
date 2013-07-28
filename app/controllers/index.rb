get '/' do
  erb :index
end

post '/login' do
  if params[:type] == 'Patient'
    self.current_user = Patient.find_by_email(params[:email])
    redirect '/user/profile'
  elsif params[:type] == "Therapist"
    self.current_user = Therapist.find_by_email(params[:email])
    redirect '/user/profile'
  # elsif params[:user_type] == "Admin"
  #   self.current_user = Admin.find_by_email(params[:email])
  else
    params.inspect
    #erb -- fuck up errors
  end
end

not_found do
	@request = request.path_info
	erb :not_found, layout: false
end

get '/profile' do
  if session[:type] == "Patient"
    redirect '/users/patients/profile'
  elsif session[:type] == "Therapist"
    redirect '/users/therapists/profile'
  elsif session[:type] == "Admin"
    redirect '/users/admin/profile'
  end
end
