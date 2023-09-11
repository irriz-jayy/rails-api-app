class Api::V1::CartItemsController < ApplicationController
  skip_before_action :authorized
  rescue_from ActiveRecord::RecordNotFound , with: :render_not_found_response


  def index
    @cart_items = CartItem.all
    render json: @cart_items
  end

  def show
    @cart_items = CartItem.find_by(id:params[:id])
    render json: @cart_items
  end

  def create
    @cart_items = CartItem.new(order_params)

    if @cart_items.save
      render json: @cart_items, status: :created
    else
      render json: { errors: @cart_items.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def render_not_found_response
    render json: {error: "Cart Item not found"}
  end
end
