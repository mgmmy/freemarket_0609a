class ProductsController < ApplicationController
  def index
    @ladies = Product.recent_category(1)
    @mens = Product.recent_category(2)
    @kids = Product.recent_category(3)
    @cosmes = Product.recent_category(4)
    @channels = Product.recent_brand(1)
    @vuittons = Product.recent_brand(2)
    @supremes = Product.recent_brand(3)
    @nikes = Product.recent_brand(4)
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
    @child_category = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
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
