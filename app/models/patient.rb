class Patient < User
  has_many :appointments
  has_many :conditions
end
