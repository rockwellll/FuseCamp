module Boostable
  extend ActiveSupport::Concern

  included do
    has_many :boosts, as: :boostable
  end
end
