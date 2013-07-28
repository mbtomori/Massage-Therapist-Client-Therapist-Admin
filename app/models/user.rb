require 'bcrypt'

class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :email, :password_hash, :first_name, :last_name, presence: true

  include BCrypt
  
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email,password)
    user = User.find_by_email(email)
    puts user
    if user
      if user.password == password
        return user
      end
    end

    return nil

  end
end
