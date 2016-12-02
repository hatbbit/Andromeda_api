class Article < ApplicationRecord
  belongs_to :user
  belongs_to :article_type
  belongs_to :last_updated_user, class_name: :User

  has_many :comments
  has_many :likes
  has_many :stocks
  has_many :actions
  has_many :article_authors
  has_many :article_histories
  has_many :article_tags
  has_many :tags, through: :article_tags

  validates :title, length: { maximum: 255 }, presence: true
  validates :body, length: { maximum: 65535 }, presence: true
  validates :draft, inclusion: { in: [true, false] }
end
