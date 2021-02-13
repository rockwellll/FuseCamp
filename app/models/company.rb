class Company < ApplicationRecord
  belongs_to :account
  belongs_to :user

  has_many :people, class_name: 'Person'
end
