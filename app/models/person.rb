class Person < ApplicationRecord
  belongs_to :user
  belongs_to :account
  belongs_to :company, optional: true
  has_and_belongs_to_many :projects

  delegate :email, to: :user
  delegate :name, to: :user

  accepts_nested_attributes_for :user
end
