class Section < ApplicationRecord
  belongs_to :course
  has_many :lessons, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
  validates :position, presence: true

  default_scope { order(position: :asc) }
end