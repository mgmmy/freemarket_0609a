# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    user = User.new
  end
  


  def create
    current_user.user.update(profile_params)
    binding.pry
    super and return
  end

  private

  def profile_params
    params.require(:profile).permit(:tel,:first_name, :last_name, :first_name_kana, :last_name_kana)
  end
end
