class UsersController < ApplicationController
  def new  
  end
  
  def address_create
    redirect_to new_user_card_path(session[:user_id])
  end

  def information

  end

  def show 
    @user = User.find(params[:id])
  end
  
end
