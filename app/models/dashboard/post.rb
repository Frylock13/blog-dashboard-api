class Dashboard::Post < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  include PgSearch
  pg_search_scope :search, against: [:title, :short, :content]

  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }
  scope :tag, -> (name) { where(:tag => name) }

  def switch_status
    if self.published == true
      self.update_attribute(:published, false)
    else
      self.update_attribute(:published, true)
    end
  end
end
