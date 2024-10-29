class User < ApplicationRecord
  validates :user_type, :first_name, :last_name, :industry, :email, :contact_number, :location, presence: true
  validates :contact_number, length: { is: 10 }
  validates :email, uniqueness: true
  has_one_attached :profile_picture
end
