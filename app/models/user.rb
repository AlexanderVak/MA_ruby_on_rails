class User < ApplicationRecord
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/.freeze
  has_many :posts, dependent: :destroy
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :images, as: :imageable

  scope :adults, -> { where('birthday <= ?', 18.years.from_now) }

  validates :personal_data, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: VALID_EMAIL }, uniqueness: true
  validates :password, presence: true, length: { minimum: 8, maximum: 15 }

  def full_name
    "#{first_name} #{last_name}"
  end
end
