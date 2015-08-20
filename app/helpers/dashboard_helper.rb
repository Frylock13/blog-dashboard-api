module DashboardHelper
  def check_status(status)
    status == 'published' ? true : false 
  end
end