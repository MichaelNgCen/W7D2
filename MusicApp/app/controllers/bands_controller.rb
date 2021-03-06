class BandsController < ApplicationController
    def delete
        @band = Band.find(params[:id])
        @band.destroy
        redirect_to bands_url
    end

    def new
        @band = Band.new
    end

    def index
        @bands = Band.all
    end

    def create
        @band = Band.new(band_params)
        if @band.save
            redirect_to band_url(@band)
        else
            render :new
        end
    end

    def edit
        @band = Band.find(params[:id])
    end

    def show
        @band = Band.find(params[:id])
    end

    def update
        @band = Band.find(params[:id])
        if @band.update(band_params)
            redirect_to band_url(@band)
        else
            render :edit
        end
    end

    private
    def band_params
        params.require(:band).permit(:name)
    end
end
