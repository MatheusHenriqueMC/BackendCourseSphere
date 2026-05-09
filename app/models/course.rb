class Course < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :sections, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  has_many :enrolled_users, through: :enrollments, source: :user

  validates :name, presence: true, length: { minimum: 3 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :level, inclusion: { in: %w[beginner intermediate advanced] }, allow_blank: true
  validates :image_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: 'must be a valid URL' }, allow_blank: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if start_date.blank? || end_date.blank?
    if end_date < start_date
      errors.add(:end_date, 'must be equal to or after start date')
    end
  end
end