class Task < ApplicationRecord
  belongs_to :daily_report, optional: true
end
