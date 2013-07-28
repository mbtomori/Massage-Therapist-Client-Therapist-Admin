post '/users/patients/new' do
  @patient = Patient.new(email: params[:email],
              password: params[:password],
              first_name: params[:first_name],
              phone: params[:phone],
              last_name: params[:last_name],
              pressure_preference: params[:pressure_preference],
              is_active: 1)
  
  if @patient
    @patient.password = params[:password]
    @patient.save

    #Create conditions
    conditions = params[:conditions].reject!(&:empty?)
    conditions.each do |condition|
      Condition.create(patient_id: @patient.id, description: condition)
    end

    self.current_user = @patient
    redirect '/users/patients/profile' #-- displays patient profile with appointment, medical information, book etc.
  else
    @patient
    erb :signup
  end
end

get '/users/patients/profile' do
  erb :user_profile
end
