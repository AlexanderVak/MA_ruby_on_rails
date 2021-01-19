class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :user, uniqueness: { scope: :group }, presence: true
  validates :group, presence: true

end
