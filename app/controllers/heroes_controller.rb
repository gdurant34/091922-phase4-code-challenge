class HeroesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Hero.all
    end

    def show
        hero = find_hero
        render json: hero, serializer: HeroWithPowersSerializer
    end



    private

    def find_hero
        Hero.find(params[:id])
    end

    def render_unprocessable_entity_response(exception)
        render json: exception.record.errors, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: { error: "Hero not found" }, status: :not_found
    end
end
