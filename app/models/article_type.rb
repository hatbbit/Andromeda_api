class ArticleType < ApplicationRecord
  has_many :articles
  validates :name, length: { maximum: 255 }, presence: true

  enum types: { blog: 1, url: 2, book: 3 }
end
