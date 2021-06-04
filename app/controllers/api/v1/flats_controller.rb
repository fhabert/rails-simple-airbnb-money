class Api::V1::FlatsController < Api::V1::BaseController
    acts_as_token_authentication_handler_for User, except: [ :index, :show, :create ]
    before_action :set_flat, only: [:show, :update]

    def index
        @flats = Flat.all
    end

    def show
    end

    def update
        if @flat.update(flat_params)
            render :show
        else
            render_error
        end
    end

    def create
        @flat = Flat.new(flat_params)
        @flat.user = current_user
        if @flat.save
            render :show, status: :created
        else
            render_error
        end
    end

    private

    def set_flat
        @flat = Flat.find(params[:id])
    end

    def flat_params
        params.require(:flat).permit(:name, :address, :description)
    end

    def render_error
        render json: { errors: @restaurant.errors.full_messages }, status: :unprocessable_entity
    end
end