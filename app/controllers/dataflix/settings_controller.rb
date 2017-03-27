class Dataflix::SettingsController < ApplicationController

  before_action :set_rental_film, only: [:remove_film_from_rental_list]

  def index
  end

  def address
    @user = User.find(current_user.id)

    ## use find_or_initialize_by to replace below
    if @user.address_id.blank?
      @address = Address.new()
    else
      @address = Address.find(@user.address_id)
    end
  end

  def film_list
    @user = User.find(params[:id])

    ##the select * adds the additional columns in the rental_lists
    #@films = @user.films.select("*").order('films.title ASC')
    @home_films = @user.films.select("*").where(rental_lists: { home: true}).order('films.title ASC')
    @rental_films = @user.films.select("*").where(rental_lists: { home: false}).order('films.title ASC')
  end

  def remove_film_from_rental_list
    respond_to do |format|
      if @rental_film.delete
        #flash[:notice] = 'Rental Film has been removed from rental list.'
        format.html { redirect_to film_list_dataflix_setting_path(current_user.id) }
        #format.js { render :nothing => true }
        format.js { head :ok }
      else
        flash.now[:alert] = 'Rental Film has not been removed to rental list.'
        format.html { redirect_to film_list_dataflix_setting_path(current_user.id) }
      end
    end
  end

  def add_film_to_rental_list
    #@rental_list = RentalList.new(rental_list_params)
    @user = User.find(params[:user_id])
    @rental_list = @user.rental_lists.build(rental_list_params)

    @rental_list_count = @user.rental_lists.count

    if @rental_list_count > 4
      flash[:alert] = 'Rental Film list is greater than 5 films, please remove some films.'
      redirect_to film_list_dataflix_setting_path(current_user.id)
    else
      if @rental_list.save
        #flash[:notice] = 'Rental Film has been added to rental list.'
        redirect_to film_list_dataflix_setting_path(current_user.id)
      else
        flash.now[:alert] = 'Rental Film has not been added to rental list.'
        redirect_to film_list_dataflix_setting_path(current_user.id)
      end
    end
  end

  private

  def set_rental_film
    @user = User.find(current_user.id)
    @rental_film = @user.rental_lists.find_by(id: params[:film_id])
    #@rental_film = RentalList.find(params[:user_id], params[:film_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The rental film you were looking for could not be found'
    redirect_to film_list_dataflix_setting_path(current_user.id)
  end

  def rental_list_params
    params.permit(:user_id, :film_id, :film_format)
  end
end