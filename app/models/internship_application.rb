class InternshipApplication < ApplicationRecord
  belongs_to :internship
  belongs_to :user

<<<<<<< HEAD
<<<<<<< HEAD
  enum :status, { pending: 0, accepted: 1, declined: 2 }
=======
  validates :user, uniqueness: { scope: :internship }
  enum :status, { Pending: 0, Accepted: 1, Declined: 2 }

>>>>>>> 36b4cd48aefba72801e4061bf0230a4ac83aa46f
=======
  validates :user, uniqueness: { scope: :internship }
  enum :status, { Pending: 0, Accepted: 1, Declined: 2 }

>>>>>>> 36b4cd48aefba72801e4061bf0230a4ac83aa46f
end
