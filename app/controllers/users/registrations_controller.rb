class Users::RegistrationsController < Devise::RegistrationsController
  def new
    user = User.new
  end
  
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      session[:user_id] = @user.id
      redirect_to phonemumber_users_path
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :first_name_kana, :last_name_kana, :birthday)
    end
end
