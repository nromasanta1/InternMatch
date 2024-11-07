class Internship < ApplicationRecord
  belongs_to :user
  has_many :internship_applications, dependent: :destroy
  validates :role, :description, :start_date, :end_date, :location, presence: true
  validates :title, presence: true, uniqueness: true
  enum role: { employee: 0, employer: 1 }
end
