class Admin::UsersController < ApplicationController
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

  private

  def film_params
    params.require(:user).permit(:search_user)
  end

end
