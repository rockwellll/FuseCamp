class Account < ApplicationRecord
  belongs_to :user
  has_many :companies
  has_many :people
end
