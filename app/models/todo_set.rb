class TodoSet < ApplicationRecord
  include Commentable, Trashable, Colorful

  scope :not_group, -> {where parent_id: nil}
  scope :groups, -> {where.not parent_id: nil }

  belongs_to :project
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
  has_rich_text :description
  has_many :todos

  belongs_to :parent, class_name: 'TodoSet', optional: true
  has_many :todo_groups, class_name: 'TodoSet', foreign_key: 'parent_id', dependent: :destroy

  before_destroy :destroy_all_todos

  def completed_todos
    todos.where(status: true).count
  end

  def all_todos
    count = todos.count
    todo_groups.each do |todo_set|
      count += todo_set.todos.count
    end
    count
  end

  def group?
    !parent_id?
  end

  def has_todos?
    todos.count != 0
  end

  def put_in_project_trash
    update deleted_at: Time.now
    project.put_in_trash self
  end

  def display_todos_status
    "#{completed_todos} / #{all_todos}"
  end

  private

  def destroy_all_todos
    todos.with_trashed.delete_all
  end
end
