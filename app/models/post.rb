class Post < ApplicationRecord
  belongs_to :user
  validates :title, :body, presence: true
  validates :title, length: { maximum: 30 }
  validates :body, length: { maximum: 256 }
end
