class User < ApplicationRecord
  before_save { email.downcase! }
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, 
              email_format: { message: 'is not looking good!' },
              uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, presence: true
  
  has_secure_password
end
