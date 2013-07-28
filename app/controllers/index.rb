get '/' do
  erb :index
end

not_found do
	@request = request.path_info
	erb :not_found, layout: false
end

get '/profile' do
  redirect "/users/#{session[:type].downcase}s/profile"
end
