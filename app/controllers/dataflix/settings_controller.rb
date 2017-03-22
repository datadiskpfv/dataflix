class Dataflix::SettingsController < ApplicationController

  before_action :set_rental_list, only: [:remove_film_from_rental_list]

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

    ##the select * adds the additional columns in the rental_lists
    @films = @user.films.select("*")
  end

  def remove_film_from_rental_list
    User.find(params[:user_id]).films

    flash[:alert] = 'Rental Film has been deleted.'
    redirect_to root_path
  end

  private

  def set_rental_list
    @rental_list = RentalList.find(params[:user_id], params[:film_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The rental film you were looking for could not be found'
    redirect_to rental_list_dataflix_setting_path(current_user.id)
  end

  def rental_list_params
    params.require(:rental_list).permit(:user_id, :film_id)
  end
end