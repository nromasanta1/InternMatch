class Internship < ApplicationRecord
  belongs_to :user
  validates :role, :description, :start_date, :end_date, :location, presence: true
  validates :title, presence: true, uniqueness: true
end
