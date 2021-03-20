class Message < ApplicationRecord
  belongs_to :message_board
  belongs_to :user

  has_rich_text :body

  validates :title, presence: true
  validates :body, presence: true
  # validates :category, presence: false, inclusion: { in: %w[announcement fyi heartbeat pitch question]}

  delegate :image, :name, to: :user, prefix: true
end
