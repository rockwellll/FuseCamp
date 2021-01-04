class Project < ApplicationRecord
  acts_as_tenant :user
  belongs_to :user
  has_one :trash, dependent: :destroy

  has_many :members, class_name: 'ProjectUser', dependent: :delete_all
  has_many :todo_lists, dependent: :destroy
  has_many :todos, through: :todo_lists

  validates :name, presence: true
  after_create_commit :link_trash

  def put_in_trash(entity)
    trash.items.create! trashable: entity
  end

  private

  def link_trash
    Trash.create!(project: self)
  end
end
