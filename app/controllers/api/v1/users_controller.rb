class Api::V1::UsersController < ApplicationController
  def index
    @user = User.all
    render json: @user
  end

  def show

  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
