class Product < ApplicationRecord

  validates :name, presence: true
  validates :image_url, format: {with: /\.(png|jpg)\Z/i, message: 'must be a URL for GIF, JPG or PNG image.' }
  validates :price, presence: true
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

  def views
     $redis.get("product:#{id}")
  end

  def viewed
    $redis.incr("product:#{id}")
  end
end
