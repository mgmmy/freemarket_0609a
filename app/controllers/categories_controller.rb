class CategoriesController < ApplicationController

  def show
    @ladies = Category.find(1)
    @ladies_child = Category.where(ancestry: 1)
    @products = Product.list_category(1)
  end
end
