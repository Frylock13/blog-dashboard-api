class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates :password, length: { in: 6..20 }
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :posts

  extend FriendlyId
  friendly_id :name, use: :slugged
end
