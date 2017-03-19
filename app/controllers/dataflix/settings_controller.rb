class Dataflix::SettingsController < ApplicationController
  def index
  end

  def address
    @user = User.find(current_user.id)

    if @user.address_id.blank?
      @address = Address.new()
    else
      @address = Address.find(@user.address_id)
    end
  end
end