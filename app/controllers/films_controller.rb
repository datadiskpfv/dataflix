class FilmsController < ApplicationController

  before_action :set_film, only: [:edit, :update, :destroy]

  def index
    #@films = Film.all
    #@films_action = Film.active_t.joins(:genre1).where(genres: {genre: 'Action'})
    #@films_horror = Film.active_t.joins(:genre1).where(genres: {genre: 'Horror'})

    @genre_action = Genre.find_by_genre('Action').id
    @films_action = Film.active_t.where("genre1_id = ? or genre2_id = ?", @genre_action, @genre_film_reviewsaction).order(release_year: :desc, release_month: :desc)

    @genre_thriller = Genre.find_by_genre('Thriller').id
    @films_thriller = Film.active_t.where("genre1_id = ? or genre2_id = ?", @genre_thriller, @genre_thriller).order(release_year: :desc, release_month: :desc)

    @genre_horror = Genre.find_by_genre('Horror').id
    @films_horror = Film.active_t.where("genre1_id = ? or genre2_id = ?", @genre_horror, @genre_horror).order(release_year: :desc, release_month: :desc)

    ##@top_rated_films = Film.includes(:film_reviews).order('film_reviews.star_rating DESC').limit(10)
    @top_rated_films = Film.joins(:film_reviews).group(:title).order('avg(film_reviews.star_rating) DESC')
  end

  def show
    @film = Film.find(params[:id])
    @reviews = FilmReview.where(film_id: @film.id).order('created_at DESC')

    if @reviews.empty?
      @avg_rating = 0
    else
      @avg_rating = FilmReview.where(film_id: @film.id).average(:star_rating).round(1)
    end
  end

  def table
    if params[:genre1] == 'top_10'
      @table_title = "Top 10 Rated Films"
    else
      genre = Genre.where(genre: params[:genre1])
      @table_title = "#{genre[0].genre}"
    end

    @genres = Genre.all

    if current_user
      @user = User.find(current_user.id)
    end

    #puts "Genre ID: #{genre.ids}"
    #puts "Genre Name: #{genre[0].genre}"

    ## added pagination using will_paginate
    if params[:genre1] == 'top_10'
      @films = Film.joins(:film_reviews).group(:title).order('avg(film_reviews.star_rating) DESC').paginate(:page => params[:page], :per_page => 6, :total_entries => 10)
    else
      @films = Film.where(genre1: genre.ids).active_t.paginate(:page => params[:page], :per_page => 6)
    end

  end

  def search_table
    @genres = Genre.all

    @search_string = params[:search]

    puts "Search String: #{@search_string}"

    if @search_string =~ /^\d{13}$/
      @film_barcode = @search_string.chop
      @film = Film.find_by_barcode("#{@film_barcode}")

      redirect_to film_path(id: @film.id)
    else
      if current_user
        @user = User.find(current_user.id)
      end

      ## active_t is a scope
      @films = Film.search(@search_string).active_t.paginate(:page => params[:page], :per_page => 6)
    end
  end

  def genre_chart
    ## i could put below directly in view but really playing passing parameters
    @chart_data = Film.active_t.joins(:genre1).group(:genre).count
  end

  def stock
  end

  def stock_location
    @films = Film.search(params[:search_film]).active_t.order('title ASC')
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.new(film_params)
    @film.blu_ray_wstock = params[:blu_ray_stock]
    @film.dvd_wstock = params[:dvd_stock]

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

    @films = Film.all

    @films.each do |film|
      @film_barcode = Barby::EAN13.new("#{film.barcode}")
      @film_barcode_for_html = Barby::HtmlOutputter.new(@film_barcode)

      film.barcode_table = @film_barcode_for_html.to_html

      film.save
    end
  end

  def barcode_form
  end

  def barcode_find
    @film_barcode = params[:barcode].chop
    @film = Film.find_by_barcode("#{@film_barcode}")

    redirect_to film_path(id: @film.id)
    ## redirect_to @film
  end

  def film_review
    @film_review = FilmReview.new()
    @film = Film.find(params[:film_id])

    if params[:rating]
      @film_review.user_id = current_user.id
      @film_review.film_id = @film.id
      @film_review.star_rating = params[:rating]
      @film_review.comments = params[:comment]

      if @film_review.save
        flash[:notice] = 'Film comment has been created.'
        redirect_to @film
      else
        flash.now[:alert] = 'Film comment has not been created.'
        render 'film_review'
      end
    end
  end

  def inactive
      @films = Film.active_f.all
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