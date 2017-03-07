class FilmsController < ApplicationController

  before_action :set_film, only: [:edit, :update, :destroy]

  def index
    @films = Film.all
  end

  def show
    @film = Film.find(params[:id])
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.new(film_params)

    if @film.save
      flash[:notice] = 'Film has been created.'
      redirect_to @film
    else
      flash.now[:alert] = 'Film has not been created.'
      render 'new'
    end
  end

  def edit
    @film = Film.find(params[:id])
  end

  def update
    if @film.update(film_params)
      flash[:notice] = 'Film has been updated.'
      redirect_to @film
    else
      flash.now[:alert] = 'Film has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @film.destroy
    flash[:alert] = 'Film has been deleted.'

    redirect_to @film
  end

  private

  def set_film
    @film = Film.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The film you were looking for could not be found'
    redirect_to films_path
  end

  def film_params
    params.require(:film).permit(:title, :description, :genre1_id, :genre2_id,
                                 :rating_id, :image1, :image1_cache, :release_year,
                                 :blu_ray_stock)
  end

end