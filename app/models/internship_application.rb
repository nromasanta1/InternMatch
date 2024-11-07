class InternshipApplication < ApplicationRecord
  belongs_to :internship
  belongs_to :user

  enum :status, { pending: 0, accepted: 1, declined: 2 }
end
