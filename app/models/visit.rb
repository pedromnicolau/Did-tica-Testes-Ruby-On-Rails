class Visit < ApplicationRecord
  belongs_to :property
  belongs_to :lead
  enum :status, { scheduled: 0, done: 1, no_show: 2 }
  validates :scheduled_at, presence: true
end
