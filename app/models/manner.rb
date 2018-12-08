class Manner < ApplicationRecord
  belongs_to :board
  has_many :photos, dependent: :destroy
  validates :entry, presence: true
end
