class CardsController < ApplicationController
  require "payjp"

  def new
    gon.payjp_test_pk = ENV['PAYJP_KEY']
  end

  def pay 
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    if params["token_submit"].blank?
      redirect_to action: "pay"
    else
      customer = Payjp::Customer.create(
      card: params["token_submit"],
      ) 
      @card = Card.new(user_id: (session[:user_id]), customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to complete_users_path
      else
        render: pay
      end
    end
  end

  def delete 
    
    if card.blank?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "howtopay"
  end

end
