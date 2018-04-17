class Booking < ApplicationRecord
  belongs_to :user, optional: true, :dependent => :destroy
  belongs_to :product, optional: true, :dependent => :destroy


end
