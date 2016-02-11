class Post < ActiveRecord::Base
  include ConvertToFormat
  include PgSearch
  include ImageUploadSettings
  extend FriendlyId

  belongs_to :user

  validates :title, :short, :content, presence: true

  enum status: %i(published unpublished archived)

  pg_search_scope :search, against: [:title, :short]

  friendly_id :title, use: :slugged

  scope :tag, -> (name) { where(tags: name) }

  default_scope { order('created_at DESC') }

  def switch_status
    published? ? unpublished! : published! # :D
  end

  # generate eng to russian url
  def generate_url(original_title)
    milled_title = Russian.translit(original_title.split(' ').join('-')).downcase # split to '*-*-*' template and translit
    finished_title = milled_title.gsub!(/\W+/, '-') # remove all symbols except '-'

    update_attribute(:slug, finished_title)
  end

  def update_tags(tags)
    update_attribute(:tags, tags)
  end

  def reset_publication_date
    self.update_attribute(:created_at, DateTime.now)
  end
end
