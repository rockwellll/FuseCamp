class Project < ApplicationRecord
  acts_as_tenant :account
  belongs_to :account
  has_one :trash, dependent: :destroy

  has_and_belongs_to_many :people
  has_many :todo_sets, dependent: :destroy

  has_one :message_board
  has_many :messages, through: :message_board

  validates :name, presence: true
  after_create_commit :link_trash
  after_create_commit :create_message_board

  delegate :email, :name, to: :account, prefix: true

  def put_in_trash(entity)
    trash.items.create! trashable: entity
  end

  private

  def link_trash
    Trash.create!(project: self)
  end

  def create_message_board
    MessageBoard.create! project: self
  end
end
