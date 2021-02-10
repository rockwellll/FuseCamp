class TrashItem < ApplicationRecord
  belongs_to :trash
  delegated_type :trashable, types: %w[Todo TodoSet]
end
