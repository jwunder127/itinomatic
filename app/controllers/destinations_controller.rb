class DestinationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @user = User.find_by(id: params[:user_id])
    @trip = Trip.find_by(id: params[:trip_id])
    @destination = Destination.find_by(id: params[:id])

    if @destination && @destination.trip_id == @trip.id && @trip.user_id == @user.id
      render json: @destination
    else
      render json: { error: "Could not find destination" }, status: 422
    end
  end

  def create
    @trip = Trip.find_by(id: params[:trip_id])
    @destination = Destination.new(destination_params.merge(trip: @trip))
    if @destination.save
      render json: @destination
    else
      render json: { error: "Could not create destination" }, status: 422
    end
  end

  def update
    @destination = Destination.find_by(id: params[:id])
    @destination.update!(destination_params)

    render json: @destination

  rescue => e
    render json: { error: "Error updating destination #{e}"}, status: 422
  end


  private

  def destination_params
    params.require(:destination).permit(:description, :latitude, :longitude, :name, :destination_type)
  end
end
