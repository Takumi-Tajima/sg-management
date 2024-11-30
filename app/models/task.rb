class Task < ApplicationRecord
  belongs_to :daily_report, optional: true

  scope :default_order, -> { order(:created_at) }
end
