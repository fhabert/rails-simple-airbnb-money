class FlatsController < ApplicationController
    def index
        if params[:query]
            sql_query = "name LIKE :query OR description LIKE :query"
            @flats = Flat.where(sql_query, query: "%#{params[:query]}%")
            @counter = @flats.count
        else
            @flats = Flat.all
            @counter = Flat.count
        end
    end

    def create
        @flat = Flat.new(flat_params)
        if @flat.save
            redirect_to root_path
        else
            render :new
        end
    end

    def new
        @flat = Flat.new()
    end

    def destroy
        @flat = Flat.find(params[:id])
        @flat.destroy
        redirect_to root_path
    end

    def show
        @flat = Flat.find(params[:id])
    end

    def update
        @flat = Flat.find(params[:id])
        @flat.update(flat_params)
        redirect_to root_path
    end

    def edit
        @flat = Flat.find(params[:id])
    end

    private

    def flat_params
        params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :url)
    end
end
