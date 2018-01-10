class User < ApplicationRecord
  validates :email, :name, presence: true

  validates :email, :password_digest, length: {minimum: 4}
  validates :email, uniqueness: true
  validates :phone, length: {is: 10}
  #validates_format_of :phone, :with => /[0-9]{10}/
  validates :phone, numericality: { only_integer: true }

  has_many :results
  has_many :messages

  has_secure_password
end
