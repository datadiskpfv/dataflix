class FilmsController < ApplicationController

  before_action :set_film, only: [:edit, :update, :destroy]

  def index
    #@films = Film.all
    #@films_action = Film.active_t.joins(:genre1).where(genres: {genre: 'Action'})
    #@films_horror = Film.active_t.joins(:genre1).where(genres: {genre: 'Horror'})

    @genre_action = Genre.find_by_genre('Action').id
    @films_action = Film.active_t.where("genre1_id = ? or genre2_id = ?", @genre_action, @genre_action).order(release_year: :desc, release_month: :desc)

    @genre_thriller = Genre.find_by_genre('Thriller').id
    @films_thriller = Film.active_t.where("genre1_id = ? or genre2_id = ?", @genre_thriller, @genre_thriller).order(release_year: :desc, release_month: :desc)

    @genre_horror = Genre.find_by_genre('Horror').id
    @films_horror = Film.active_t.where("genre1_id = ? or genre2_id = ?", @genre_horror, @genre_horror).order(release_year: :desc, release_month: :desc)
  end

  def show
    @film = Film.find(params[:id])
  end

  def table
    genre = Genre.where(genre: params[:genre1])
    @table_title = "#{genre[0].genre}"

    @genres = Genre.all

    #puts "Genre ID: #{genre.ids}"
    #puts "Genre Name: #{genre[0].genre}"

    ## added pagination using will_paginate
    @films = Film.where(genre1: genre.ids).active_t.paginate(:page => params[:page], :per_page => 6)
  end

  def search_table
    @genres = Genre.all
    @search_string = params[:search]

    if current_user
      @user = User.find(current_user.id)
    end

    ## active_t is a scope
    @films = Film.search(params[:search]).active_t.paginate(:page => params[:page], :per_page => 6)
  end

  def genre_chart
    ## i could put below directly in view but really playing passing parameters
    @chart_data = Film.active_t.joins(:genre1).group(:genre).count
  end

  def stock
  end

  def stock_location
    @films = Film.search(params[:search_film]).active_t
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

  def import
    puts "in import"
  end

  def imports
    Film.import(params[:file])
    #redirect_to root_url, notice: 'Products imported.'
  end

  def film_location
    #@user = User.find(params[:user_id])
    @film = Film.find(params[:film_id])
    @film_format = params[:film_format]

    @film_location = @film.rental_lists.where(home: true, film_format: params[:film_format])
  end

  def barcode
    require 'barby/barcode/ean_13'
    require 'barby/barcode/code_128'
    require 'barby/outputter/html_outputter'
    require 'barby/outputter/png_outputter'

    #@film_barcode = Film.find(params[:film_id]).barcode

    @films = Film.all

    @films.each do |film|
      @film_barcode = Barby::EAN13.new("#{film.barcode}")
      @film_barcode_for_html = Barby::HtmlOutputter.new(@film_barcode)

      film.barcode_table = @film_barcode_for_html.to_html

      film.save
    end
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
                                 :blu_ray_stock, :dvd_stock, :active)
  end

end