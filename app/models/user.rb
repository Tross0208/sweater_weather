class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest

  has_secure_password
  def self.validate_user(user_data)
    if user_data[:password] != user_data[:password_confirmation]
      return "Password does not match password confirmation"
    elsif user_data[:password].length == 0
      return "No password provided"
    elsif user_data[:email].length == 0
      return "No email provided"
    elsif User.find_by(email: user_data[:email])
      return "Email has already been registered"
    else
      return "Validated"
    end
  end
end
