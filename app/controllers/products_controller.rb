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

    @parent_category = []
    Category.where(ancestry: nil).each do |parent|
      @parent_category << parent.name
    end
    
    @sizes = Size.all
    @status = Status.all
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
    @child_category = Category.find_by(name: "#{params[:parent_name]}").children
  end

  def get_grandchild_category
    @grandchild_category = Category.find("#{params[:child_id]}").children
  end
  
  def search
  end

  private

  def product_params
    params.require(:product).permit(:name, :detail, :condition_id, :price, :status, :brand_id, :category_id, :size_id, :user_id, :like, :delivery_fee, :method_id)
  end

  def image_params
    params.require(:image).permit({images: []})
  end
  
end
