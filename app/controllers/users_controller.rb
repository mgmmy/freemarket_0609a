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

  def login
    @user = User.where(email: params[:user][:email], passwprd: params[:user][:password])
    binding.pry
    if @user
      redirect_to user_path(session[:user_id])
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      redirect_to 'sessions/new'
      @email = params[:email]
      @password = params[:password]
      
    end
  end
end