class Gps < ApplicationRecord
  belongs_to :board
  validates :gps, presence: true
end
