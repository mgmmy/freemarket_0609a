class CardsController < ApplicationController
  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
  end

  def pay 
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    if params["token_submit"].blank?
      redirect_to action: "pay"
    else
      customer = Payjp::Customer.create(
      card: params["token_submit"],
      ) 
      @card = Card.new(user_id: (current_user.id), customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to complete_users_path
      else
        render :pay
      end
    end
  end

  def show 
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  # routes.rb内にdeleteが許可されてない
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
