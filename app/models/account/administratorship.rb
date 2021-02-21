class Account::Administratorship < ApplicationRecord
  belongs_to :person
  belongs_to :account
end