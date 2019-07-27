class ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end

  def show
  end

  def purchase
  end

  def new 
    @product = Product.new 
    @product.images.build

    @parent_category = []
    Category.where(ancestry: nil).each do |parent|
      @parent_category << parent.name
    end
    
  end

  def create
    @product = Product.new(product_params)
    if @product.save 
      image_params[:images].each do |image|
        @product.image.create(image: image, product_id: @product.id)
      end
      redirect_to product_path(@product)
    else
      @product.images.build
      flash[:alert] = '未入力項目があります'
      redirect_back(fallback_location: root_path)
    end
  end

  def get_child_category
    @child_category = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_grandchild_category
    @grandchild_category = Category.find("#{params[:child_id]}").children
  end

  def get_sizes
    size_child = Category.find("#{params[:child_id]}")
    if size_related_child = size_child.sizes[0]  
      @sizes = size_related_child.children
    end
  end

  def get_delivery_method
    charge = Charge.find("#{params[:charge_id]}")
    if charge.id == 2
      @packages = DeliveryMethod.where(id: [1,6,7,3])
    else
      @packages = DeliveryMethod.all
    end
  end
  
  def search
  end

  private

  def product_params
    params.require(:product).permit(:name, :detail, :condition_id, :price, :status_id, :brand_id, :categories_id, :size_id, :user_id, :like, :charges_id, :prefecture_id, :delivery_method_id)
  end

  def image_params
    params.require(:image).permit({images: []})
  end
  
end
