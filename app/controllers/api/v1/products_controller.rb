class Api::V1::ProductsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]

  def index
    @products = Product.all
    render json: @products
  end

  def show
    @product = Product.find_by(id: params[:id])

    if @product
      render json: @product, status: :ok
    else
      render json: {error: "Product not found"}
    end
  end

  def create
    @product = Product.create(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: {errors:@product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
  
    if @product
      if @product.update(product_params)
        render json: @product, status: :ok
      else
        render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Product not found" }, status: :not_found
    end
  end
  

  def destroy
    @product = Product.find_by(id:[:id])

    if @product
      @product.destroy
      head :no_content
    else
      render json: {error: "Product not found"}
    end
  end

  private
  
  def product_params
    params.require(:product).permit(:brand, :name, :description, :image_url, :price, :stock , :color, :size)
  end

end
