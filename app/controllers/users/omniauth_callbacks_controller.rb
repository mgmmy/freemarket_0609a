class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google
    callback_for(:google)
  end

  def callback_for(provider)
    auth = request.env["omniauth.auth"]
    @user = User.find_oauth(auth)
    if @user.last_name == auth.info.last_name
      redirect_to information_users_path
    elsif @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
    end
  end

  def failure
    redirect_to root_path and return
  end
end
