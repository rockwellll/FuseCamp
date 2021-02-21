class Account < ApplicationRecord
  include Account::Administrered

  belongs_to :user
  has_many :companies, dependent: :delete_all
  has_many :people, dependent: :delete_all
  has_many :projects, dependent: :delete_all

  delegate :email, :name, :image, to: :user
end
