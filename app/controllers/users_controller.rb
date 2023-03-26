class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def create
        new_user = User.create!(user_params)
        render json: new_user, status: :created
    end

    def show
        user = Seller.find(params[:id])
        render json: user, status: :ok
    end

    def destroy
        user = Seller.find(params[:id])
        user.destroy
        head :no_content
    end

    private
    def user_params
        params.permit(:username, :email, :password)
    end

    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def record_not_found(not_found)
        render json: not_found, status: 404
    end
end
