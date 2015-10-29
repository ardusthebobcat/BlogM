class User < ActiveRecord::Base
  has_many :comments
  has_many :posts
  validates :email, presence: true

  attr_accessor :password
  validates_confirmation_of :password
  before_save :encrypt_password


  def fullname
    self.first.concat(" ").concat(self.last)
  end

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
