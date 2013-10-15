require 'digest'

class User < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :hashed_password, :password_confirmation, :password, :user_type, :username
  attr_accessor :password

  before_save :encrypt_new_password

  validates :firstname, :presence => :true
  validates :lastname, :presence => :true
  validates :username, :presence => :true,
    :uniqueness => :true

  validates :password, :presence => :true,
    :confirmation => :true,
    :if => :password_required?

  validates :user_type, :presence => :true

  def self.authenticate(user_name, password)
    user = find_by_username(user_name)
    return user if user && user.authenticated?(password)
  end

  def authenticated?(password)
    self.hashed_password == encrypt(password)
  end

  protected

  def encrypt_new_password
    return if password.blank?
    self.hashed_password = encrypt(password)
  end

  def encrypt(string)
    Digest::SHA1.hexdigest(string)
  end

  def password_required?
    self.hashed_password.blank? || password.present?
  end

end
