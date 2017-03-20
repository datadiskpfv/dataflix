class Admin::AddressesController < Admin::ApplicationController

  before_action :set_address, only: [:edit, :update, :destroy]

  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
  end

  def create
    # get the user as we will need to add the address
    @user = User.find(params[:address][:user_id])

    ## remove the user_id from address as it does not exist
    params[:address].delete :user_id

    @address = Address.new(address_params)

    if @address.save
      # now we can add the address to the user and save it
      @user.address_id = @address.id
      @user.save
      flash[:notice] = 'Address has been created.'
      redirect_to admin_addresses_path
    else
      flash.now[:alert] = 'Address has not been created.'
      render 'new'
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    # get the user as we will need to add the address
    @user = User.find(params[:address][:user_id])

    ## remove the user_id from address as it does not exist
    params[:address].delete :user_id

    if @address.update(address_params)
      @user.address_id = @address.id
      @user.save
      flash[:notice] = 'Address has been updated.'
      redirect_to admin_addresses_path
    else
      flash.now[:alert] = 'Address has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @address.destroy
    flash[:alert] = 'Address has been deleted.'

    redirect_to admin_addresses_path
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
                                    :city, :postcode_id, :county_id, :country_id, :user_id)
  end
end