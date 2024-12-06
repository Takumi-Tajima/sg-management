class DailyReport < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  scope :default_order, -> { order(:created_at) }
end
