class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :tags
end
