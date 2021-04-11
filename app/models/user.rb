class User < ApplicationRecord
  has_many :articles, dependent: :destroy

  validates :name, presence: true, length: {maximum: 35}

  before_validation :set_name, on: :create


  private

  def set_name
    self.name = "Товарисч №#{rand(777)}" if self.name.blank?
  end
end
