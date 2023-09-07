class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    @user = User.all
    render json: @user
  end

  def show

  end

  def create
    @user = User.new(user_params)

    if @user.save
      token = encode_token(user_id: @user.id)
      render json:{ user: @user, jwt: token}, status: :created
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def profile
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:full_name,:username, :email, :password)
  end

end
