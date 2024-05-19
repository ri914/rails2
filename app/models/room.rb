class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations,dependent: :destroy
end
