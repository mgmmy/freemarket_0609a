class UsersController < ApplicationController
  def show
    @user = current_user
    @user = User.new
    
  end
end

