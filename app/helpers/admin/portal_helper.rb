module Admin::PortalHelper
  def is_admin?
    current_user.find_by_type 'admin'
  end

  def is_super_admin?
    current_user.find_by_type 'super_admin'
  end
end
