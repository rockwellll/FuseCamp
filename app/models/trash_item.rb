class TrashItem < ApplicationRecord
  belongs_to :trash
  belongs_to :trashable, polymorphic: true
end
