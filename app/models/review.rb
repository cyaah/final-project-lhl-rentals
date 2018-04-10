class Review < ApplicationRecord
  belongs_to :product
  belongs_to :booking
  belongs_to :user

  validates :product_id, presence: true
  validates :booking_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  validates :rating, presence: true

  def blank_stars
    5 - rating.to_i
  end

end
