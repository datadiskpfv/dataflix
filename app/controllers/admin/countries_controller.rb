class Admin::CountriesController < Admin::ApplicationController

  before_action :set_country, only: [:edit, :update, :destroy]

  def index
    @countries = Country.order(:country).all
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)

    if @country.save
      flash[:notice] = 'Country has been created.'
      redirect_to admin_countries_path
    else
      flash.now[:alert] = 'Country has not been created.'
      render 'new'
    end
  end

  def edit
    @country = Country.find(params[:id])
  end

  def update
    if @country.update(country_params)
      flash[:notice] = 'Country has been updated.'
      redirect_to admin_countries_path
    else
      flash.now[:alert] = 'Country has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @country.destroy
    flash[:alert] = 'Country has been deleted.'

    redirect_to admin_countries_path
  end

  private

  def set_country
    @country = Country.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The country you were looking for could not be found'
    redirect_to admin_countries_path
  end

  def country_params
    params.require(:country).permit(:country)
  end

end