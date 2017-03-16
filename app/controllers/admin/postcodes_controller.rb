class Admin::PostcodesController < Admin::ApplicationController

  before_action :set_postcode, only: [:edit, :update, :destroy]

  def index
    @postcodes = Postcode.order(:postcode).all
  end

  def new
    @postcode = Postcode.new
  end

  def create
    @postcode = Postcode.new(postcode_params)

    if @postcode.save
      flash[:notice] = 'Postcode has been created.'
      redirect_to admin_postcodes_path
    else
      flash.now[:alert] = 'Postcode has not been created.'
      render 'new'
    end
  end

  def edit
    @postcode = Postcode.find(params[:id])
  end

  def update
    if @postcode.update(postcode_params)
      flash[:notice] = 'Postcode has been updated.'
      redirect_to admin_postcodes_path
    else
      flash.now[:alert] = 'Postcode has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @postcode.destroy
    flash[:alert] = 'Postcode has been deleted.'

    redirect_to admin_postcodes_path
  end

  private

  def set_postcode
    @postcode = Postcode.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The postcode you were looking for could not be found'
    redirect_to admin_postcodes_path
  end

  def postcode_params
    params.require(:postcode).permit(:postcode)
  end

end