class InternshipApplication < ApplicationRecord
  belongs_to :internship
  belongs_to :user

  validates :user, uniqueness: { scope: :internship }
  enum :status, { Pending: 0, Accepted: 1, Declined: 2 }
end
