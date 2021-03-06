class ApplicationController < ActionController::Base
  # あとでコメントアウト外す
  before_action :basic_auth, if: :production?
  # protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # # 未ログイン時はログインページに遷移する
  # before_action :authenticate_user!
  

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,address_attributes: [:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :user_id]])
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :encrypted_password])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :avatar])
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '1234'
      # username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def user_root_path
    user_path(current_user.id)
  end
end
