module Account::Administrered
  extend ActiveSupport::Concern

  included do
    has_many :administratorships do
      def grant(person)
        create_or_find_by person: person
      end

      def revoke(person)
        where(person: person).destroy_all
      end
    end

    has_many :administrators, through: :administratorships, source: :person
  end
end