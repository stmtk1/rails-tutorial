class User < ApplicationRecord
  before_save { email.downcase! }
  has_many :microposts
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: {with: /\A[\w+.]+@[a-z\d\-.]+\.[a-z]+\Z/i}, uniqueness: true
  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }
end
