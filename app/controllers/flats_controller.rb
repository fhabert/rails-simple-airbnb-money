class FlatsController < ApplicationController
    before_action :set_flat, only: [:show, :edit, :destroy, :update]

    def index
        if params[:query]
            sql_query = "name LIKE :query OR description LIKE :query OR address LIKE :query"
            @flats = Flat.where(sql_query, query: "%#{params[:query]}%")
        else
            @flats = Flat.all
        end
        @flats_liked = UserFlat.where(user_id: current_user.id)
        @flats_liked_id = @flats_liked.map { |flat| flat.flat_id}
        respond_to do |format|
            format.html
            format.json { render json: { flats: @flats} }
        end
    end

    def create
        @flat = Flat.new(flat_params)
        @flat.user_id = current_user.id
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
        @flat.destroy
        redirect_to root_path
    end

    def show
        @counter = 1
        @owner_id = @flat.user_id
        @chatrooms = Chatroom.where(owner_id: current_user.id, flat_id: @flat.id)
        if @flat.geocoded?
            @marker = {lat: @flat.latitude, lng: @flat.longitude,
            info_window: @flat.name, image_url: helpers.asset_url('sax.jpg') }
        end
    end

    def update
        if @flat.update(flat_params)
            redirect_to root_path
        else
            render :edit
        end
    end

    def edit
    end

    def saved
        flats_user = UserFlat.where(user: current_user)
        @flats = flats_user.map { |flat| Flat.find(flat.flat_id)}
    end
    
    def index_update
        flat = Flat.find(params[:flat_id])
        if params[:btn_like] == "add"
            UserFlat.create(flat: flat, user: current_user)
        else
            userFlats = UserFlat.where(flat_id: flat.id)
            userFlat = userFlats.find_by(user: current_user)
            userFlat.destroy
        end
        redirect_to root_path(anchor: "flat-#{flat.id}")
    end

    private

    def set_flat
        @flat = Flat.find(params[:id])
    end

    def flat_params
        params.require(:flat).permit(:name, :address, :description, :price_cents, :number_of_guests, :url)
    end
end
