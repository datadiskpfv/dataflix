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

    @address_count = @user.address

    ##the select * adds the additional columns in the rental_lists
    #@films = @user.films.select("*").order('films.title ASC')
    @home_films = @user.films.select("*").where(rental_lists: { home: true}).order('films.title ASC')
    @rental_films = @user.films.select("*").where(rental_lists: { home: false}).order('films.title ASC')
  end

  def remove_film_from_rental_list

    ## decrease the warehouse stock
    if params[:film_format] == 'blu-ray'
      @rental_film.film.blu_ray_wstock += 1
    else
      @rental_film.film.dvd_wstock += 1
    end

    respond_to do |format|
      if @rental_film.delete
         @rental_film.film.save
        #flash[:notice] = 'Rental Film has been removed from rental list.'
        format.html { redirect_to film_list_dataflix_setting_path(@user.id) }
        #format.js { render :nothing => true }
        format.js { head :ok }
      else
        flash.now[:alert] = 'Rental Film has not been removed to rental list.'
        format.html { redirect_to film_list_dataflix_setting_path(@user.id) }
        format.js { head :ok }
      end
    end
  end

  def add_film_to_rental_list
    #@rental_list = RentalList.new(rental_list_params)
    @user = User.find(params[:user_id])
    @rental_list = @user.rental_lists.build(rental_list_params)

    @rental_list_count = @user.rental_lists.where(home: false).count

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

  def user_defaults
    @user = User.find(current_user.id)
  end

  def previous_films_list
    @user = User.find(current_user.id)
    @previous_films_list = @user.previous_films.limit(100).order('previous_films.created_at DESC')
  end

  private

  def set_rental_film
    @user = User.find(params[:user_id])

    if params[:barcode]
     #respond_to do |format|
       @film_barcode = params[:barcode].chop
       @rental_film = Film.find_by_barcode("#{@film_barcode}")

       ## lets make sure the film has been found using the barcode
       if @rental_film.nil?
         puts "Film is nil"
         flash[:alert] = "Invalid barcode"
         render :nothing => true
         #format.js { head :ok }
       else
         @rental_film = @user.rental_lists.find_by(user_id: @user.id, film_id: @rental_film.id, film_format: params[:film_format])
         puts "Rental Film: #{@rental_film}"
         ## let make sure that the user does have the film at home
         if @rental_film.nil?
           flash[:alert] = "User does not have this film at home"
           render :nothing => true
           #format.js { head :ok }
         end
       end
       #render :nothing => true
     #end
    else
      ## non-barcode films, using the return film button
      @rental_film = @user.rental_lists.find_by(id: params[:film_id])
    end
    puts "going to remove_film_rental_from_rental_list"
    #@rental_film = RentalList.find(params[:user_id], params[:film_id])
  #rescue ActiveRecord::RecordNotFound
    #flash[:alert] = 'The rental film you were looking for could not be found'
    #redirect_to film_list_dataflix_setting_path(current_user.id)
  end

  def rental_list_params
    params.permit(:user_id, :film_id, :film_format)
  end
end