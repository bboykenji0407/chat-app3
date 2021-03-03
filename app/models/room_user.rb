class RoomUser < ApplicationRecord
  belongs_to :room
  bekongs_to :user
end
