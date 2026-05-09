class Lesson < ApplicationRecord
  belongs_to :course
  belongs_to :section, optional: true

  validates :title, presence: true, length: { minimum: 3 }
  validates :status, presence: true, inclusion: { in: %w[draft published] }
  validates :video_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: 'must be a valid URL' }, allow_blank: true
end