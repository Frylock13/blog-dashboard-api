class Post < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user

  enum status: %i(published unpublished archived)

  include PgSearch
  pg_search_scope :search, against: [:title, :short, :content]

  scope :published, -> { where(status: 0) }
  scope :unpublished, -> { where(status: 1) }
  scope :archived, -> { where(status: 2) }
  scope :tag, -> (name) { where(:tag => name) }

  def switch_status
    published? ? unpublished! : published! # :D
  end
end
