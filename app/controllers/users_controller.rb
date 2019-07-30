class UsersController < ApplicationController
  def address_create
    redirect_to new_user_card_path(current_user.id)
  end

  
end

