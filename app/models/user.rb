class User < ApplicationRecord
  validates :email, :name, presence: true
  validates :phone, length: {is: 10}
  validates :email, :password, length: {minimum: 4}
  validates :email, uniqueness: true
  validates :phone, numericality: {only_integer: true}

  has_many :results
  has_many :messages

  has_secure_password
end
