class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :therapist
  has_many   :ratings

  def booked?
    !self.patient_id.nil?
  end
end
