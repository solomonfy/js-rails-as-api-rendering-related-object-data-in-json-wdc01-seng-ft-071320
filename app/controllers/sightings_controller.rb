class SightingsController < ApplicationController

    def index
        sightings = Sighting.all
        # render json: sightings
        render json: sightings, include: [:bird, :location], except: [:updated_at]
    end

    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            # render json: sighting
            # render json: {id: sighting.id, bird: sighting.bird, location: sighting.location} # customized hash
            # render json: sighting, include: [:bird, :location], except: [:updated_at]
            render json: sighting.to_json(:include => {:bird => {:only => [:name, :species]}, :location => {:only => [:latitude, :longitude]}}, except: [:updated_at])

        else
            render json: {message: "No sighting found with this id"}
        end
        
    end
end
