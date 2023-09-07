class Api::V1::ProductsController < ApplicationController
  skip_before_action :authorized

  def index
    @products = Product.all
    render json: @products
  end

  def show
  end

  def create
    @product = Product.create(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: {errors:@product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private
  
  def product_params
    params.require(:product).permit(:brand, :name, :description, :image_url, :price, :stock , :color, :size)
  end

end
