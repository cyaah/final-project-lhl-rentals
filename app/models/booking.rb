class Booking < ApplicationRecord
  belongs_to :profile, optional: true
  belongs_to :product, optional: true
end
