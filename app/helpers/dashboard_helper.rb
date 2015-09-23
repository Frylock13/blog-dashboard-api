module DashboardHelper
  def check_status(status)
    status == 'published' ? true : false
  end

  def get_tags(tags)
    tags.present? ? tags.join(',') : 'Your tag here'
  end

  def get_link_for_export(format)
    case params[:action]
    when 'index'
      dashboard_posts_path(format: format)
    when 'unpublished'
      unpublished_dashboard_posts_path(format: format)
    when 'archived'
      archived_dashboard_posts_path(format: format)
    end
  end
end
