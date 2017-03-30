module Dataflix::SettingsHelper

  def get_user_name(user)
    user_name = user.email.split("@").first
    name = user_name.split('.')

    return "#{name.map(&:capitalize).join(' ')}"
  end
end