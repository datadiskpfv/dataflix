class RatingsController < ApplicationController

  before_action :set_rating, only: [:edit, :update, :destroy]

  def index
    @ratings = Rating.order(:rating).all
  end

  def new
    @rating = Rating.new
  end

  def show
    @rating = Rating.find(params[:id])
  end

  def create
    @rating = Rating.new(rating_params)

    if @rating.save
      flash[:notice] = 'Rating has been created.'
      redirect_to ratings_path
    else
      flash.now[:alert] = 'Rating has not been created.'
      render 'new'
    end
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def update
    if @rating.update(rating_params)
      flash[:notice] = 'Rating has been updated.'
      redirect_to @rating
    else
      flash.now[:alert] = 'Rating has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @rating.destroy
    flash[:alert] = 'Rating has been deleted.'

    redirect_to @rating
  end

  private

  def set_rating
    @rating = Rating.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The rating you were looking for could not be found'
    redirect_to rating_path
  end

  def rating_params
    params.require(:rating).permit(:rating)
  end

end
