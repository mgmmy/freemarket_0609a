class AddressesController < ApplicationController
  def phonemumber
    @profile=Profile.new
  end

  def tel
    @profile=Profile.new(tel_params)
    params[:profile][:user_id]=session[:user_id]
    if @profile=nil?
      redirect_to new_user_session_path
    else 
      current_user.profile.update(tel_params)
      redirect_to address_address_path
    end
  end

  def address
    @peofile=Profile.new
  end

  def address_comp
    @profile=params[:profile]
    if @profile=nil?
      @profile=current_user.profile
      @error='未記入の箇所があります。'
    else
      @profile=current_user.profile.update(profile_params)
      redirect_to new_user_card_path(current_user.id)
    end
  end

  private
  def tel_params
    params.require(:profile).permit(:tel)
  end

  def profile_params
    params.require(:profile).permit(:last_name, :first_name, :first_name_kana, :last_name_kana, :tel, :postalcode, :city, :block, :building, :prefecture_id)
  end
end

