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

post '/appointments/change' do
  appointments = []
  date = Date.parse(params[:date])
  Appointment.all.each do |appt|
    if appt.appt_at.year == date.year && appt.appt_at.month == date.month && appt.appt_at.day == date.day && appt.patient_id.nil?
      appointments << "<div class='appointment'>
      <span>#{appt.appt_at}</span>
      <form class='span_butt' action='/users/patients/profile/book' method='post'>
      <input type='hidden' name='appointment_id' value=#{appt.id}>
      <input type='hidden' name='patient_id' value=#{current_user.id}>
      <input type='submit' value='Book It'></form></div>"
    end
  end
  appointments.join.to_json
  # appointments.join.to_json
end
