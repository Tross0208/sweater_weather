class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest

  has_secure_password
  def self.validate_user(user_data)
    validate_password(user_data) && validate_email(user_data)
  end

  def self.validate_password(user_data)
    (user_data[:password] == user_data[:password_confirmation]) && (user_data[:password].length > 0)
  end

  def self.validate_email(user_data)
    (user_data[:email].length > 0) && !(User.find_by(email: user_data[:email]))
  end

end
