class Trash < ApplicationRecord
  belongs_to :project
  has_many :items, class_name: 'TrashItem'
end
