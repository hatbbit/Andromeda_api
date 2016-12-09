class User < ApplicationRecord
  has_many :actions
  has_many :article_authors
  has_many :articles
  has_many :comments
  has_many :likes
  has_many :stocks

  validates :email, confirmation: true
  validates :email_confirmation, presence: true, on: :create

  validates :name, length: { maximum: 255 }, presence: true
  validates :email, length: { maximum: 255 }, presence: true

  has_secure_password
end
