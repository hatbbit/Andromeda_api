class ArticleType < ApplicationRecord
  has_many :articles
  validates :name, length: { maximum: 255 }, presence: true

  enum types: { blog: 0, url: 1, book: 2 }
end
