module Colorful
  extend ActiveSupport::Concern

  included do
    has_one :color, as: :colorable, dependent: :destroy
  end
end

