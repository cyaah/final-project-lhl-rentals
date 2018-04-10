class Review < ApplicationRecord
  belongs_to :product
  belongs_to :booking
  belongs_to :user

end
