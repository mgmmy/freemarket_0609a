class ImagesController < ApplicationController
  def index
    @image = Image.new
  end

  def create
    @product = Product.find(params[:id])
    @image = Image.create(image_params)  
  end

  private
  def image_params
    params.require(:image).permit(:image).merge(product_id: )
  end
end
