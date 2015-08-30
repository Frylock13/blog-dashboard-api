class Post < ActiveRecord::Base
  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :title, :short, :content, presence: true

  belongs_to :user

  enum status: %i(published unpublished archived)

  include PgSearch
  pg_search_scope :search, against: [:title, :short]

  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :published, -> { where(status: 0) }
  scope :unpublished, -> { where(status: 1) }
  scope :archived, -> { where(status: 2) }
  scope :tag, -> (name) { where(tags: name) }

  default_scope { order('created_at DESC') }

  def switch_status
    published? ? unpublished! : published! # :D
  end

  #generate eng url if russian title
  def generate_url(original_title)
    original_title = original_title.split(' ').join('-') # kinda qwe-asd-fdg
    update_attribute(:slug, Russian.translit(original_title))
  end

  def update_tags(tags)
    update_attribute(:tags, tags)
  end
end
