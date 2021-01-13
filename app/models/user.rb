class User < ApplicationRecord
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/.freeze
  has_many :posts

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: {with: VALID_EMAIL}, uniqueness: true
  validates :password, presence: true, length: {minimum: 8, maximum: 15 }

  scope :adults, -> { where('birthday <= ?', 18.years.from_now) }




end
