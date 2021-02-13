class Person < ApplicationRecord
  belongs_to :user
  belongs_to :account
  belongs_to :company, optional: true
  belongs_to :project, optional: true

  delegate :email, to: :user
  delegate :name, to: :user
end
