class Hub < ApplicationRecord
  belongs_to :board

  has_many :messages
end
