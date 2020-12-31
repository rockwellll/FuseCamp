class Todo < ApplicationRecord
  include Trashable

  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  belongs_to :todo_list
  has_one :project, through: :todo_list
  has_rich_text :notes

  # after_create_commit { broadcast_append_to "todos-#{todo_list.id}"}

  validates :name, presence: true

  scope :not_completed, -> { where status: false}
  scope :completed, -> { where status: true}

  def status_completed?
    status
  end
end
