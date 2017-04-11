class Product < ApplicationRecord

  validates :name, presence: true
  validates :image_url, format: { with: %r{\A.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.' }
  validates :price, presence: true, format: {with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: {greater_than: 0, less_than: 1000000 }
  has_many :orders
  has_many :comments

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end

  def average_rating
    comments.average(:rating).to_f
end
end
