class Board < ApplicationRecord
  validates :name, presence: true

  has_many :hubs
end
