class SpicesController < ApplicationController
    def index
        spice = Spice.all
        render json: spice
    end

    def create
        spice_make = Spice.create(spice_params)
        render json: spice_make, status: :created
    end

    def update
        spice = spice_find
        spice.update(spice_params)
        render json: spice
    end

    def destroy
        spice = spice_find
        spice.destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def spice_find
        Spice.find(params[:id])
    end
end
