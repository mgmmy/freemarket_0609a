class AddressesController < ApplicationController
  def phonemumber
    @address=Address.new
  end

  def tel
    @address=Address.new(address_params)
    params[:address][:user_id]=session[:user_id]
    # @address=current_user.address.assign_attributes(address_params)
    if @address=nil?
      redirect_to new_user_session_path
    else 
      current_user.address.update(address_params)
      redirect_to address_address_path
    end
  end

  def address
    @address=Address.new
  end

  def address_comp
    @address=params[:address]
    if @address=nil?
      @address=current_user.address
      @error='未記入の箇所があります。'
    else
      @address=Address.update(address_params)
      redirect_to new_user_card_path(current_user.id)
    end
  end

  private

  def address_params
    params.require(:address).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postalcode, :prefectures_id, :city, :block, :buiding, :tel, :user_id)
  end
  end

