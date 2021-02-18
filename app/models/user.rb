class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

  has_many :todo_sets
  has_one :account, dependent: :destroy

  after_create_commit :create_account

  def self.from_google_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.image = auth.info.image
      user.password = Devise.friendly_token[0,20]
      user.is_member = false
      user.name = auth.info.name
    end
  end

  private

  def create_account
    Account.create!(user: self) unless is_member
  end
end
