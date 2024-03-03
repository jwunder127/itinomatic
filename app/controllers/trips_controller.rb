class TripsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @user = User.find_by(id: params[:user_id])

    @trip = @user.trips.find_by(id: params[:id])
    if @trip
      render json: @trip
    else
      render json: {error: "There was an error finding the trip" }, status: 404
    end

  end

  def create
    @user = User.find_by(id: params[:user_id])
    @trip = Trip.new(trip_params.merge(user: @user))

    if @trip.save
      render json: @trip
    else
      render json: {error: "There was an error creating the trip"}
    end
  end


  private

  def trip_params
    params.permit(:name, :description)
  end
end
