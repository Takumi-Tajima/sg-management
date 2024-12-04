class Chat < ApplicationRecord
  belongs_to :user
  has_many :chats, dependent: :destroy

  scope :default_order, -> { order(:created_at) }
end
