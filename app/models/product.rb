class Product < ApplicationRecord

  belongs_to :profile, optional: true
  #belongs_to :category
  has_many :booking

  validates :name, presence: true
  validates :price, presence: true


end
