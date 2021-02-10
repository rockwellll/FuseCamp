module Trashable
  extend ActiveSupport::Concern

  included do
    default_scope do
      where deleted_at: nil
    end

    has_one :trash_item, as: :trashable, dependent: :destroy

    scope :with_trashed, -> { unscope(where: :deleted_at)}
    scope :trashed, -> { with_trashed.where.not deleted_at: nil}
  end
end
