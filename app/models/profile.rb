class Profile < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # :confirmable, :omniauthable

  validates :first_name, presence: true, length: {maximum:20}
  validates :last_name, presence: true, length: {maximum:30}

  has_many :products
  has_many :bookings

  # def self.from_omniauth(auth)
  #   profile = Profile.where(email: auth.info.email).first
  #
  #   if profile
  #     return profile
  #   else
  #     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #       profile.email = auth.info.email
  #       profile.password = Devise.friendly_token[0,20]
  #       profile.first_name = auth.info.name   # assuming the profile model has a name
  #       profile.image = auth.info.image # assuming the user model has an image
  #       profile.uid = auth.uid
  #       profile.provider = auth.provider
  #
  #       # If you are using confirmable and the provider(s) you use validate emails,
  #       # uncomment the line below to skip the confirmation emails.
  #       profile.skip_confirmation!
  #     end
  #   end
  # end

end
