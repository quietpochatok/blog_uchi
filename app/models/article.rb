class Article < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
end
