class Admin::CountiesController < Admin::ApplicationController

  before_action :set_county, only: [:edit, :update, :destroy]

  def index
    @counties = County.order(:county).all
  end

  def new
    @county = County.new
  end

  def create
    @county = County.new(county_params)

    if @county.save
      flash[:notice] = 'County has been created.'
      redirect_to admin_counties_path
    else
      flash.now[:alert] = 'County has not been created.'
      render 'new'
    end
  end

  def edit
    @county = County.find(params[:id])
  end

  def update
    if @county.update(county_params)
      flash[:notice] = 'County has been updated.'
      redirect_to admin_counties_path
    else
      flash.now[:alert] = 'County has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @county.destroy
    flash[:alert] = 'County has been deleted.'

    redirect_to admin_counties_path
  end

  private

  def set_county
    @county = County.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The county you were looking for could not be found'
    redirect_to admin_counties_path
  end

  def county_params
    params.require(:county).permit(:county, :country_id)
  end

end