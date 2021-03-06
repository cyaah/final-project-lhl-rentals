class Product < ApplicationRecord


  has_attached_file :image, styles:  { medium: "420x420>", large: "400x400>" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  belongs_to :user, optional: true
  belongs_to :category, optional: true

  has_many :bookings, :dependent => :destroy
  has_many :reviews, :dependent => :destroy



  validates :name, presence: true
  validates :price, presence: true
  validates :category, presence: true
  #test


end
