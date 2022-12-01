class PowersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Power.all
    end

    def show
        render json: find_power
    end

    def update
        power = find_power
        power.update!(power_params)
        render json: power, status: :accepted
    end

    private

    def power_params
        params.permit(:description)
    end

    def find_power
        Power.find(params[:id])
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: ["validation errors"] }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: { error: "Power not found" }, status: :not_found
    end
end
