class Company < ApplicationRecord
  belongs_to :account

  has_many :people, class_name: 'Person'
end
