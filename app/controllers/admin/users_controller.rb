class Admin::UsersController < ApplicationController

  before_action :set_user, only: [:archive, :unarchive, :make_admin, :undo_admin]

  def index
  end

  def search_edit
  end

  def search_table
    @search_string = params[:search_user]
    @users = User.search(@search_string)
  end

  def edit
  end

  def update
  end

  def archive
    @user.archive

    flash[:notice] = "User has been archived."
    redirect_to search_edit_admin_users_path
  end

  def unarchive
    @user.unarchive

    flash[:notice] = "User has been unarchived."
    redirect_to search_edit_admin_users_path
  end

  def make_admin
    @user.make_admin

    flash[:notice] = "User has is now an administrator."
    redirect_to search_edit_admin_users_path
  end

  def undo_admin
    @user.undo_admin

    flash[:notice] = "User is no longer an administrator"
    redirect_to search_edit_admin_users_path
  end

  def user_returns_list
    @user = User.find(params[:id])

    ##the select * adds the additional columns in the rental_lists
    #@films = @user.films.select("*").order('films.title ASC')
    @home_films = @user.films.select("*").where(rental_lists: { home: true}).order('films.title ASC')
    @rental_films = @user.films.select("*").where(rental_lists: { home: false}).order('films.title ASC')
  end

  def send_home
    @user = User.find(params[:user_id])
    @film = @user.rental_lists.find_by(id: params[:film_id])

    @film.home = true

    respond_to do |format|
      if @film.save
        #flash[:notice] = 'Rental Film has been removed from rental list.'
        format.html { redirect_to film_list_dataflix_setting_path(current_user.id) }
        #format.js { render :nothing => true }
        format.js { head :ok }
      else
        flash.now[:alert] = 'Rental Film has not been sent home.'
        format.html { redirect_to film_list_dataflix_setting_path(current_user.id) }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The user you were looking for could not be found'
    redirect_to search_edit_admin_users_path
  end

  def user_params
    params.require(:user).permit(:search_user)
  end

end
