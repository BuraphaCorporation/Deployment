module Management::PortalHelper
  def is_management?
    current_user.find_by_type 'management'
  end

  def is_super_management?
    current_user.find_by_type 'super_management'
  end
end
