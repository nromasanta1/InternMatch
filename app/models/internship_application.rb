class InternshipApplication < ApplicationRecord
  belongs_to :internship
  belongs_to :user

  validates :user, uniqueness: { scope: :internship }
  validates :user, presence: true
  validates :title, presence: true
  validates :name, presence: true
  validates :role, presence: true
  validates :location, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :compensation, presence: true
  validates :description, presence: true
  enum :status, { pending: 0, accepted: 1, declined: 2 }
end
