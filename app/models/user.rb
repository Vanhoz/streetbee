class User < ApplicationRecord
  has_secure_password

  has_many :uploads
  
  validates_presence_of :name, :email, :password_digest
end
