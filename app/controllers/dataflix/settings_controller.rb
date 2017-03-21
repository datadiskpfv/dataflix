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

  def rental_list
    @user = User.find(params[:id])
    @films = @user.films.select("*, rental_lists.film_format AS film_format")
  end
end