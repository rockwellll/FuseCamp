class TodoSet < ApplicationRecord
  include Commentable, Trashable

  default_scope do
    where parent_id: nil
  end

  belongs_to :project
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
  has_rich_text :description
  has_many :todos

  belongs_to :parent, class_name: 'TodoSet', optional: true
  has_many :todo_sets, class_name: 'TodoSet', foreign_key: 'parent_id', dependent: :destroy

  before_destroy :destroy_all_todos

  def completed_todos
    todos.where(status: true).count
  end

  def has_todos?
    todos.count != 0
  end

  def put_in_project_trash
    update deleted_at: Time.now
    project.put_in_trash self
  end

  def display_todos_status
    "#{completed_todos} / #{todos.count}"
  end

  private

  def destroy_all_todos
    todos.with_trashed.delete_all
  end
end
