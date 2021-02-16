class Boost < ApplicationRecord
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  belongs_to :boostable, polymorphic: true

  validates :message, length: { maximum: 16 }, presence: true

  delegate :email, to: :creator
  delegate :name, to: :creator
end