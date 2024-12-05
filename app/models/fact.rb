class Fact < ApplicationRecord
  belongs_to :task
  has_one :retrospective, dependent: :destroy
end
