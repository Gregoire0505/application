class TownsController < ApplicationController
  before_action :find_town, only: [:show, :edit, :update, :destroy]

    def index
      @towns = Town.all.order("created_at DESC")
    end

    def new
      @town = Town.new
    end

    def show
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


    def edit
    end

    def update
      if @town.update(town_params)
        redirect_to town_path(@town)
      else
        render 'edit'
      end
    end

    def destroy
      @town.destroy
      redirect_to town_path
    end

    private
      def  town_params
        params.require(:town).permit(:name, :description, :location)
      end

      def find_town
        @town = Town.find(params[:id])
        @town = Town.find(params[:publication_id])
      end

end
