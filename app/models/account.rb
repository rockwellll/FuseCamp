class Account < ApplicationRecord
  belongs_to :user
  has_many :companies, dependent: :delete_all
  has_many :people, dependent: :delete_all
  has_many :projects, dependent: :delete_all

  delegate :email, :name, to: :user
end
