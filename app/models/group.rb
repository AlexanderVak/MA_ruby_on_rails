class Group < ApplicationRecord
  has_many  :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :images, as: :imageable

  validates :name, presence: true, uniqueness: true
  validates :group_type, :status, presence: true

end
