require 'bcrypt'

class User < ActiveRecord::Base
  
  include BCrypt
  
  validates :username, :password_digest, :presence => true
  validates :username, :uniqueness => true
  
  has_many :subscriptions
  
  def password=(password)
    # creates password_digest from passed password parameter
    self.password_digest = Password.create(password)
  end
  
  def is_password?(password)
    # check out BCrypt and what this does
    Password.new(self.password_digest) == password
  end
  
  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return user if user.is_password?(password)
    nil
  end
  
  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(32)
    self.save
  end
end
