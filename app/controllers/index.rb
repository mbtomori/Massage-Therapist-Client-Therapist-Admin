get '/' do
  erb :index
end

get '/users/signup' do
  erb :sign_up
end

not_found do
	@request = request.path_info
	erb :not_found, layout: false
end
