class Product < ApplicationRecord


  has_attached_file :image, styles:  { medium: "300x300>", large: "450x450>" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  belongs_to :user, optional: true
  belongs_to :category, optional: true

  has_many :booking
  has_many :reviews



  validates :name, presence: true
  validates :price, presence: true
  validates :category, presence: true
  #test


end
