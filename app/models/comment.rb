class Comment < ApplicationRecord
  include Boostable

  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  belongs_to :commentable, polymorphic: true
  has_rich_text :content

  validates :content, presence: true
end
