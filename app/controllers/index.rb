get '/' do
  erb :index
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
