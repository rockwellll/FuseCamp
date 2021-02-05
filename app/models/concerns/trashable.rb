module Trashable
  extend ActiveSupport::Concern

  included do
    default_scope do
      where deleted_at: nil
    end

    scope :with_trashed, -> { unscope(where: :deleted_at)}
    scope :trashed, -> { with_trashed.where.not deleted_at: nil}
  end
end
