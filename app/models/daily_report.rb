class DailyReport < ApplicationRecord
  has_many :tasks, dependent: :destroy
end
