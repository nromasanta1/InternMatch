class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :first_name, :last_name, :industry, :email, :contact_number, :location, presence: true
  # validates :contact_number, length: { is: 10 }
  validates :email, uniqueness: true
  # has_one_attached :profile_picture
  enum user_type: { employer: 0, applicant: 1 }
end
