class TodoSet < ApplicationRecord
  include Commentable

  belongs_to :project
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
  has_rich_text :description

  has_many :todos, dependent: :delete_all

  def completed_todos
    todos.where(status: true).count
  end

  def has_todos?
    todos.count != 0
  end

  def display_todos_status
    "#{completed_todos} / #{todos.count}"
  end
end
