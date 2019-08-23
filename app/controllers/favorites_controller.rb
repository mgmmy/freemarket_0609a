class FavoritesController < ApplicationController
  before_action :set_product
  
  def create
    @like = Favorite.create(user_id: session[:user], product_id: params[:product_id])
    @likes = Favorite.where(product_id: params[:product_id])
    @product.reload
  end

  def destroy
    like = Favorite.find_by(user_id: session[:user], product_id: params[:product_id])
    like.destroy
    @likes = Favorite.where(product_id: params[:product_id])
    @product.reload
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end
