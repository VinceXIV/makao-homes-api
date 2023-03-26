class SellerSessionsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def create
        seller = Seller.find_by!(username: params[:username])
        seller = seller.authenticate(params[:password])
        render json: seller, status: :created
    end

    def destroy
        head :no_content
    end

    private
    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def record_not_found(not_found)
        render json: not_found, status: 404
    end
end
