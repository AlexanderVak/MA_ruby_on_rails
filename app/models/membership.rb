class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :user, uniqueness: { scope: :group }, presence: true
  validates :group, presence: true

  enum status: [ :active, :unactive, :banned ], _default: 'unactive'

end
