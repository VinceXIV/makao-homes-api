class SellersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def create
        new_seller = Seller.create!(seller_params)
        render json: new_seller, status: :created
    end

    def show
        seller = Seller.find(params[:id])
        render json: seller, status: :ok
    end

    def destroy
        seller = Seller.find(params[:id])
        seller.destroy
        head :no_content
    end

    private
    def seller_params
        params.permit(:username, :email, :password)
    end

    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def record_not_found(not_found)
        render json: not_found, status: 404
    end  
end
