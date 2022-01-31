class SightingsController < ApplicationController

  def index
    sightings = Sighting.where(date: params[:start_date]..params[:end_date])
    render json: sightings
  end
  

  def create
    sighting = Animal.find(params[:animal_id]).sightings.create(sighting_params)
    if sighting.valid?
      render json: sighting
    else
      render json: sighting.errors
    end
  end

  def update
    sighting = Animal.find(params[:animal_id])
    sighting.sightings.update(sighting_params)
    if sighting.valid?
      render json: sighting.sightings
    else
      render json: sighting.sightings.errors
    end
  end

  def destroy
    sighting = Animal.find(params[:animal_id])
    if sighting.sightings.destroy
      render json: sighting.sightings
    else
      render json: sighting.sightings.errors
    end
  end

private
  def sighting_params
    params.require(:sighting).permit(:latitude, :longitude, :animal_id, :start_date, :end_date, :date)
  end
end