class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :body, presence: true

  # Это поле должно быть, только если не выполняется user.present? (у объекта на задан юзер)
  validates :user_name, presence: true, unless: -> { user.present? }

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end
end
