class User < ActiveRecord::Base
  include GenerateToken
  include ImageUploadSettings

  authenticates_with_sorcery!

  validates_confirmation_of :password
  validates_presence_of :password, on: :create
  validates :password, length: { in: 4..20 }
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :posts
end
