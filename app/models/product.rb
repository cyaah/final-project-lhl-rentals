class Product < ApplicationRecord

  belongs_to :profile
  #belongs_to :category
  has_many :booking

  validates :name, presence: true
  validates :price, presence: true


end
