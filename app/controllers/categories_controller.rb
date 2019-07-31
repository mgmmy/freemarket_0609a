class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @products = Product.ransack(category_id: params[:id]).result
  end
end
