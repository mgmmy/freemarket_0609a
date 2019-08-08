class CardsController < ApplicationController
  require "payjp"

  def new
    gon.payjp_test_pk = 'pk_test_96c564d4594eefb82a8e0bfa'
  end

  def pay 
    Payjp.api_key = 'sk_test_8bd97780242b34346ce182bf'
    if params["token_submit"].blank?
      redirect_to action: "pay"
    else
      customer = Payjp::Customer.create(
      card: params["token_submit"],
      ) 
      binding.pry
      @card = Card.new(user_id: (session[:user_id]), customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        binding.pry
        redirect_to complete_users_path
      else
        binding.pry
        redirect_to action: "pay"
      end
    end
  end

  def delete 
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "howtopay"
  end

end
