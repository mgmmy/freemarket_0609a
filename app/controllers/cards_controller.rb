class CardsController < ApplicationController

  require "payjp"

  def howtopay
    card = Card.where(user_id: current_user.id)
    if @card.save
      redirect_to complete_users_path
    else
      redirect_to howtopay_path
    end
  end

  def pay 
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "howtopay"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to complete_users_path
      else
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
