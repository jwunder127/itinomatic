class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render json: @user
    else
      render json: {error: "Error finding user"}, status: 404
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: 200
    else
      render json: {error: "Error creating user"}, status: 422
    end
  end

  def update
    @user = User.find_by(params[:id])
    @user.update!(user_params)
    render json: @user
  rescue => e
    render json: {error: "Error updating user: #{e}"}, status: 422
  end


  private
  def user_params
    params.permit(:email, :first_name, :last_name, :avatar)
  end
end
