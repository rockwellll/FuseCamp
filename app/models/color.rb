class Color < ApplicationRecord
  belongs_to :colorable, polymorphic: true
end
