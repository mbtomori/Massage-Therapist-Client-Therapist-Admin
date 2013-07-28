class Patient < User
  has_many :conditions
  has_many :appointments
end
