module DashboardHelper
  def check_status(status)
    status == 'published' ? true : false
  end

  def get_tags(tags)
    tags.present? ? tags.join(',') : 'Your tag here'
  end
end
