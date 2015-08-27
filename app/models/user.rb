class User < ActiveRecord::Base
  include GenerateToken

  authenticates_with_sorcery!

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates :password, length: { in: 6..20 }
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :posts

  extend FriendlyId
  friendly_id :name, use: :slugged

  def generate_api_key
    update_attribute(:api_key, SecureRandom.urlsafe_base64(nil, false))
  end
end
