module ApplicationHelper

  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end

  def check_not_admin
    true if !current_user.try(:admin?)
  end
end