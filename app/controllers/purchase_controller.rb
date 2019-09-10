class PurchaseController < ApplicationController

  before_action :authenticate_user!, only: [:index]
  require 'payjp'

  def index
    @card = Card.where(user_id: current_user.id)
    if @card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      @product = Product.find(params[:product_id])
    end
  end

  def pay
    @card = Card.find_by(user_id: current_user.id)
    @product = Product.find(params[:product_id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    customer: @card.customer_id,
    amount: product.price,
    currency: 'jpy'
    )
  redirect_to root_path, id: session[:user_id]
  end
end
