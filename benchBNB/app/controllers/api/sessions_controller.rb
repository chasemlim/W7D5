class Api::SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if user
      login!(user)
    else
      render text: "Invalid credentials", status: 422
    end
  end

  def destroy
    if logged_in?
      logout!
      render json: {}
    else
      render text: "404 Not Found", status: 404
    end
  end
end
