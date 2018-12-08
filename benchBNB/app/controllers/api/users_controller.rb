class Api::UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if User.find_by_credentials(user_params[:username], user_params[:password])
      render text: "Username already exists", status: 401
    end

    if @user.save
      render json: @user
    else
      render json: @user.errors
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
