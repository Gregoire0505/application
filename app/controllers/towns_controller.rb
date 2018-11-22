class TownsController < ApplicationController
  before_action :find_town
  
    def new
      @town = Town.new
    end

    def create
      @town = Town.new(town_params)
      @town.publication_id = @publication.id

      if @town.save
        redirect_to publication_path(@publication)
        else
          render 'new'
        end
      end
    end


    private
      def  town_params
        params.require(:town).permit(:name, :description, :location)
      end

      def find_town
        @town = Town.find(params[:publication_id])
      end

end
