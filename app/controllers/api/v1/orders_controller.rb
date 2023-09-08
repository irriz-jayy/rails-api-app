class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound , with: :render_not_found_response
  skip_before_action :authorized

  def index
    @orders = Order.all
    render json: @orders
  end
  # GET /orders/:id
  def show
    render json: set_order
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created
    else
      render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/:id
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /orders/:id
  def destroy
    @order.destroy
    head :no_content
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:user_id, :product_id, :quantity, :status)
  end

  def render_not_found_response
    render json: {error: "Product not found"}
  end
end
