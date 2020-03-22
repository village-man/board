class Hub < ApplicationRecord
  validates :name, presence: true
  validates :description, length: { maximum: 400 }

  belongs_to :board
  belongs_to :user

  has_many :messages
end
