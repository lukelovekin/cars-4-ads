class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :post_pics
  validates :post_pics, length: {maximum: 9}
  validates :price, numericality: { only_integer: false }
end
