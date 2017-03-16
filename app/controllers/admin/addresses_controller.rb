class Admin::AddressesController < Admin::ApplicationController

  before_action :set_address, only: [:edit, :update, :destroy]

  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)

    if @address.save
      flash[:notice] = 'Address has been created.'
      redirect_to admin_addresses_path
    else
      flash.now[:alert] = 'Address has not been created.'
      render 'new'
    end
  end

  private

  def set_address
    @address = Address.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The address you were looking for could not be found'
    redirect_to admin_addresses_path
  end

  def address_params
    params.require(:address).permit(:house_name, :house_number, :address1, :address2,
                                    :town, :city, :postcode_id, :county_id, :country_id)
  end
end