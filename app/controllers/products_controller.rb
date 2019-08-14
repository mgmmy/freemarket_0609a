class ProductsController < ApplicationController
  before_action :set_product, only: [ :show, :edit, :update ]
  include ProductsHelper

  def index
    @ladies = Product.recent_category(1)
    @mens = Product.recent_category(219)
    @kids = Product.recent_category(378)
    @cosmes = Product.recent_category(528)
    @channels = Product.recent_brand(1)
    @vuittons = Product.recent_brand(2)
    @supremes = Product.recent_brand(3)
    @nikes = Product.recent_brand(4)
  end

  def show
    @products = Product.where(user_id: @product.user_id).limit(6)
    @images = @product.images
    @product.charge_id == 0 ? @fee = "送料込み（出品者負担）" : @fee = "着払い(購入者負担)"
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
    if brand = Brand.find_by(name: params[:product][:brand_id])
      params[:product][:brand_id] = brand.id
    else
      params[:product][:brand_id] = Brand.create(name: params[:product][:brand_id]).id
    end

    @product = Product.new(product_params)
    if @product.save && params[:images][:image]!= ""
      params[:images][:image].each do |image|
        @product.images.create(image: image, product_id: @product.id)
      end
      redirect_to product_path(@product)
    else
      @product.images.build
      flash.now.alert = '未入力項目があります'
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
    new
    @keyword = params[:keyword]
    @result_products = Product.where("name LIKE(?)", "%#{@keyword}%")
    @q = Product.ransack(params[:q])

    select_size = get_size_search.find(:id)
    if select_size = 1 || 4 
      @seach_sizes = Size.where(ancestry: 1)
    elsif select_size == 2
      @seach_sizes = Size.where(ancestry: 29)
    elsif select_size == 3
      @seach_sizes = Size.where(ancestry: 12)
    else
      @seach_sizes = Size.all
    end
  end

  def search_category
    @search_child = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def search_grandchild_category
    @search_grandchild = Category.find("#{params[:child_id]}").children
  end

  
   


  private

  def product_params
    params.require(:product).permit(:name, :detail, :condition_id, :price, :status_id, :brand_id, :category_id, :size_id, :charge_id, :prefecture_id, :delivery_method_id, :shipment_id, images_attributes: {image: []}).merge(user_id: session[:user_id])
  end  

  def set_product
    @product = Product.find(params[:id])
  end
end
