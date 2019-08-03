class UsersController < ApplicationController
  def address_create
    binding.pry
    redirect_to new_user_card_path(current_user.id)
  end


end

