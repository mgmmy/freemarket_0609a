class PurchaseController < ApplicationController

  before_action :authenticate_user!, only: [:index]
  before_action :move_to_show
  require 'payjp'

  def index
    @user = User.find(current_user.id)
    @profile = Profile.find(current_user.id)
    @card = Card.find(current_user.id)
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
    @purchase = Purchase.find_by(params[:product_id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    customer: @card.customer_id,
    amount: @product.price,
    currency: 'jpy'
    )
  @product.update(status_id: 2)
  @purchase.update(buyer_id: current_user.id)
  redirect_to root_path, id: session[:user_id]
  end

  private

  def move_to_show
    @product = Product.find(params[:product_id])
    redirect_to product_path(@product.id) if @product.status_id == 2
  end
end
