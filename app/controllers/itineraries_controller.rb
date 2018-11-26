class ItinerariesController < ApplicationController
  before_action :find_itinerary, only: [:show, :edit, :update, :destroy]

    def index
      @itineraries = Itinerary.all.order("created_at DESC")
    end

    def show
    end

    def new
      @itinerary = Itinerary.new
    end

    def create
      @itinerary = Itinerary.new(itinerary_params)
      if @itinerary.save
        redirect_to "/itineraries"
      else
        render 'new'
      end
    end

    def edit
    end

    def update
      if @itinerary.update(itinerary_params)
        redirect_to itineraries_path(@itinerary)
      else
        render 'edit'
      end
    end

    def destroy
      @itinerary.destroy
      redirect_to itineraries_path
    end

    private
      def itinerary_params
        params.require(:itinerary).permit(:name, :description, :activity_place, :duration)
      end

      def find_itinerary
        @itinerary = Itinerary.find(params[:id])
      end

end
