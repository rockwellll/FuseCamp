class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :todo_sets, through: :projects
  has_one :account

  after_create_commit :create_account

  private

  def create_account
    Account.create!(user: self) unless is_member
  end
end
