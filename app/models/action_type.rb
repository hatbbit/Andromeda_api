class ActionType < ApplicationRecord
  has_many :actions

  validates :name, length: { maximum: 255 }, presence: true
end
