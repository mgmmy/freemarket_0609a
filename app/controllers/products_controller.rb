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
    @product.images.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save 
      image_params[:images].each do |image|
        @product.image.create(image: image, product_id: @product.id)
      end
      redirect_to product_path(@product)
    else
      @item.item_images.build
      flash[:alert] = '未入力項目があります'
      redirect_back(fallback_location: root_path)
    end

  end
  
  def search
  end

  private

  def product_params
    params.require(:product).permit(:name, :detail, :condition_id, :price, :status, :brand_id, :lar_category_id, :mid_category_id, :sml_category_id, :size_id, :user_id, :like, :delivery_fee, :method_id)
  end

  def image_params
    params.require(:image).permit({images: []})
  end
  
end
