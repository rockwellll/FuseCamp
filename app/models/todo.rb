class Todo < ApplicationRecord
  include Commentable, Trashable

  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  belongs_to :todo_set
  has_rich_text :notes

  # after_create_commit { broadcast_append_to "todos-#{todo_set.id}"}

  validates :name, presence: true

  scope :not_completed, -> { where.not status: true}
  scope :completed, -> { where status: true}

  def status_completed?
    status
  end
end
