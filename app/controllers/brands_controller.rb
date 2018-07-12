class BrandsController < ApplicationController

    before_action :set_brand, only: [:show, :update, :destroy, :followers]

    # GET /brands
    def index
        @brands = Brand.all
        json_response(@brands)
    end

    # POST /brands
    def create
        @brand = Brand.create!(brand_params)
        json_response(@todo, :created)
    end

    # GET /brands/:id
    def show
        json_response(@brand)
    end

    # PUT /brands/:id
    def update
        @brand.update(brand_params)
        head :no_content
    end

    # DELETE /brands/:id
    def destroy
        @brand.destroy
        head :no_content
    end

    # GET /brands/:id/followers
    def followers
        json_response(@brand.followers)
    end

    private

        def brand_params
            # whitelist params
            params.permit(:name)
        end

        def set_brand
            @brand = Brand.find(params[:id])
        end

end
