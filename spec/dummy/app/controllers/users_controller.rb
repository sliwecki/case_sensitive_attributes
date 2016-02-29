class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    render json: @user
  end

  def show
    @user = User.last
    render json: @user
  end

  private

  def user_params
    params.permit(:email, :first_name, :last_name)
  end
end
