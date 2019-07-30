# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
    @profile = @user.build_profile
  end
  
  def create
    super and return
  end
end
