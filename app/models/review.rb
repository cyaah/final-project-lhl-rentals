class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :description, presence: true
  validates :rating, presence: true

  def blank_stars
    5 - rating.to_i
  end

end
