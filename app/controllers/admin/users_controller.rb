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
