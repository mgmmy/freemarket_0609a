class UsersController < ApplicationController
  def address_create
    redirect_to new_user_card_path(session[:user_id])
  end

  def information

  end

  def show 
  end

  def destroy_user_session
    session[:user_id]=nil
  end

  
end