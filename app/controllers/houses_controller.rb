class HousesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def create
        render json: House.create!(house_params), status: :created
    end

    def index
        render json: House.all, status: :ok
    end

    def show
        house = House.find(params[:id])
        render json: house, status: :ok
    end

    def update
        house = House.find(params[:id])
        house.update(house_params)
        render json: house, status: :ok
    end

    def destroy
        house = House.find(params[:id])
        house.destroy
        head :no_content
    end

    private
    def house_params
        params.permit(:name, :description, :location, :price, :bedrooms, :size_in_sqft, :seller_id, :image_url)
    end

    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def record_not_found(not_found)
        render json: not_found, status: 404
    end  
end
