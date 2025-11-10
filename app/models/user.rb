class User < ApplicationRecord
  has_secure_password
  has_many :tasks  # ← AGREGA ESTA LÍNEA

  validates :email, 
    presence: true,
    uniqueness: true,
    format: { with: URI::MailTo::EMAIL_REGEXP }
    
  validates :name, presence: true
  validates :password, length: { minimum: 6 }, on: :create
end