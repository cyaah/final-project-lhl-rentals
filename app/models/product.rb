class Product < ApplicationRecord
  has_attached_file :image, styles:  { medium: "300x300>", large: "450x450>" }
   # has_attached_file :url => '/public/uploads/product/image/:id/:style/:basename.:extension' 
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :name, presence: true
  validates :price, presence: true

end
