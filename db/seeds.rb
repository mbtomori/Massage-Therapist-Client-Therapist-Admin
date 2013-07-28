require 'faker'

class ApptTime
	def self.rand_time(from, to=Time.now)
	  Time.at(rand_in_range(from.to_f, to.to_f))
	end

	def self.rand_in_range(from, to)
  	rand * (to - from) + from
	end
end

20.times do |num|
	user = Patient.create(
		email: Faker::Internet.email,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		password: 'password')
	p "user #{num}: #{user}"
end

20.times do |num|
	user = Therapist.create(
		email: Faker::Internet.email,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		password: 'password')
	p "user #{num}: #{user}"
end

20.times do |num|
	appointment = Appointment.create(
		appt_at: ApptTime.rand_time(2.days.ago),
		patient: [Patient.all.sample,nil].sample,
		therapist: Therapist.all.sample
		)
	p "appointment #{num}: #{appointment}"
end

# class ApptTime
# 	def self.rand_time(from, to=Time.now)
# 	  Time.at(rand_in_range(from.to_f, to.to_f))
# 	end
# end