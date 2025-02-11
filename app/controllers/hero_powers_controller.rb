class HeroPowersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create 
        hero = HeroPower.create!(hero_power_params)
        render json: hero.hero, serializer: HeroWithPowersSerializer, status: :created
    end

    private

    def hero_power_params
        params.permit(:strength, :power_id, :hero_id)
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: ["validation errors"] }, status: :unprocessable_entity
    end
end
