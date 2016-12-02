class ArticleType < ApplicationRecord
  has_many :articles

  validates :name, length: { maximum: 255 }, presence: true
end
