class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :user_id, uniqueness: { scope: :course_id, message: 'already enrolled in this course' }
end