class Task < ApplicationRecord
  belongs_to :daily_report, optional: true
  has_many :facts, dependent: :destroy

  scope :default_order, -> { order(:created_at) }
end
