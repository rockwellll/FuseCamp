class Todo < ApplicationRecord
  include Commentable, Trashable

  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  belongs_to :todo_set
  has_rich_text :notes

  validates :name, presence: true

  scope :not_completed, -> { where.not status: true}
  scope :completed, -> { where status: true}

  delegate :project, to: :todo_set

  def status_completed?
    status
  end

  def put_in_project_trash
    update deleted_at: Time.now
    project.put_in_trash self
  end
end
