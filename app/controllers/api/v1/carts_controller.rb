class Api::V1::CartsController < ApplicationController
  skip_before_action :authorized
  rescue_from ActiveRecord::RecordNotFound , with: :render_not_found_response


  def index
    @carts = Cart.all
    render json: @carts
  end

  def show
    @cart = Cart.find_by(id:params[:id])
    render json: @cart
  end

  def create
    @cart = Cart.new(order_params)

    if @cart.save
      render json: @cart, status: :created
    else
      render json: { errors: @cart.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def render_not_found_response
    render json: {error: "Cart not found"}
  end
end
