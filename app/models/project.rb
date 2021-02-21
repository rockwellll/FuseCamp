class Project < ApplicationRecord
  acts_as_tenant :account
  belongs_to :account
  has_one :trash, dependent: :destroy

  has_and_belongs_to_many :people
  has_many :todo_sets, dependent: :destroy

  validates :name, presence: true
  after_create_commit :link_trash

  delegate :email, :name, to: :account, prefix: true

  def put_in_trash(entity)
    trash.items.create! trashable: entity
  end

  private

  def link_trash
    Trash.create!(project: self)
  end
end
