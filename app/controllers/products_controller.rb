class ProductsController < ApplicationController
  before_action :set_product, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!, only: [ :new, :edit, :destroy ]

  include ProductsHelper

  def index
    @ladies = Product.recent_category(1..218)
    @mens = Product.recent_category(219..377)
    @kids = Product.recent_category(378..527)
    @cosmes = Product.recent_category(528..638)
    @channels = Product.recent_brand(1)
    @vuittons = Product.recent_brand(2)
    @supremes = Product.recent_brand(3)
    @nikes = Product.recent_brand(4)
  end

  def show
    @products = Product.where(user_id: @product.user_id).limit(6)
    @images = @product.images
    @product.charge_id == 0 ? @fee = "送料込み（出品者負担）" : @fee = "着払い(購入者負担)"
    @grandchild_category = @product.category
    @child_category  = @product.category.parent
    @parent_category = @product.category.parent.parent
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

    params[:product][:status_id] ||= 1 

    @product = Product.new(product_params)
    if @product.save && params[:images][:image]!= ""
      params[:images][:image].each do |image|
        @product.images.create(image: image, product_id: @product.id)
      end

      # Purchase.create(seller_id: current_user.id, product_id: @product.id)
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

  def edit
    @products = Product.where(user_id: @product.user_id).limit(6)
    @images = @product.images
    @product.charge_id == 0 ? @fee = "送料込み（出品者負担）" : @fee = "着払い(購入者負担)"
    @commission = (@product.price * 0.1).round
    @profit = @product.price - @commission

    @grandchild_category = Category.where(id: @product.category_id)
    categories = @grandchild_category[0][:ancestry].split('/')
    @parent_category = Category.where(id: categories[0])
    @child_category = Category.where(id: categories[1])

    @parent_categories = Category.where(ancestry: nil)
    @child_categories = Category.where('ancestry LIKE ?', "#{@parent_category[0][:id]}")
    @grandchild_categories = Category.where('ancestry LIKE ?', "%/#{@child_category[0][:id]}")

    unless @product.size_id.nil?
      @size = Size.where(id: @product.size_id)
      @sizes = Size.where(ancestry: @size[0][:ancestry])  
    end
  end

  def update
    edit
    if @product.update!(update_params)
      redirect_to product_path(@product.id), notice: '商品を更新しました。'
    else
      render :edit, alert: 'error'
    end
  end

  def destroy
    if @product.user_id == current_user.id
       if @product.destroy
        redirect_to user_path(current_user.id), notice: '商品を削除しました。'
       else
        render :show
       end
    else
      render :show
    end
  end
  
  def search
    @keyword = params[:keyword]
    
    if params[:keyword].present?
      @search = Product.ransack(name_or_detail_cont: params[:keyword])
      @result_products = @search.result.order('created_at desc').page(params[:page]).per(48)
    elsif params[:q].present?
      @search = Product.ransack(search_params)
      @keyword = search_params[:name_or_detail_cont] 
      @result_products = @search.result.order('created_at desc').page(params[:page]).per(48)
    elsif 
      @result_products = Product.order('created_at desc').page(params[:page]).per(48)
    end
    
    params[:q] ||= {sorts: 'id desc'}
    @search ||= Product.ransack()
    new
  end

  def search_category
    @search_child = Category.find_by(name: params[:parent_name], ancestry: nil).children
  end

  def search_grandchild_category
    @search_grandchild = Category.find("#{params[:child_id]}").children
  end

  def search_size_id
    if params[:size_id] == "1"
      @size_id = Size.where(ancestry: 1)
    elsif params[:size_id] == "2" 
      @size_id = Size.where(ancestry: 29)
    elsif params[:size_id] == "3"
      @size_id = Size.where(ancestry: 12)
    end
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :detail, :condition_id, :price, :status_id, :brand_id, :category_id, :size_id, :charge_id, :prefecture_id, :delivery_method_id, :shipment_id, images_attributes: {image: []}).merge(user_id: current_user.id)
  end

  def update_params
    parameter = params.require(:product).permit(:name, :detail, :condition_id, :price, :status_id, :brand_id, :category_id, :size_id, :charge_id, :prefecture_id, :delivery_method_id, :shipment_id, :parent_category, :child_category, user_id: current_user.id)
    update_params = parameter.except(:parent_category, :child_category)
  end

  def search_params
    params.require(:q).permit(:sorts, :name_or_detail_cont, :category_id_eq, :size_id_eq, :price_gteq, :price_lteq, {condition_id_eq_any: []}, {charge_id_eq_any: []}, {status_id_eq_any: []}).merge(search_brand_params)
  end

  def search_brand_params
    params[:q][:brand_id_cont].present?
    if brand = Brand.find_by(name: params[:q][:brand_id_eq])
      brand_id = brand.id
    end
    {brand_id_eq: brand_id}
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
