module Dataflix::SettingsHelper

  def get_user_name(user)
    user_name = user.email.split("@").first
    first_name = user_name.split('.').first.capitalize
    last_name = user_name.split('.').last.capitalize
    return "#{first_name} #{last_name}"
  end
end
