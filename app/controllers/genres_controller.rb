class GenresController < ApplicationController

  before_action :set_genre, only: [:edit, :update, :destroy]

  def index
    @genres = Genre.order(:genre).all
  end

  def new
    @genre = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      flash[:notice] = 'Genre has been created.'
      redirect_to genres_path
    else
      flash.now[:alert] = 'Genre has not been created.'
      render 'new'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    if @genre.update(genre_params)
      flash[:notice] = 'Genre has been updated.'
      redirect_to @genre
    else
      flash.now[:alert] = 'Genre has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @genre.destroy
    flash[:alert] = 'Genre has been deleted.'

    redirect_to @genre
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The genre you were looking for could not be found'
    redirect_to genres_path
  end

  def genre_params
    params.require(:genre).permit(:genre)
  end

end
