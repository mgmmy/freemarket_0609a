class ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    # @products = Product.where('name LIKE(?)', "%#{params[:keyword]}%").limit(124)
  end

  def show
  end

  def purchase
  end

  def new
    @product = Product.new
  end

  def search
  end
end
