class ProductsController < ApplicationController
    before_action :set_brand
    before_action :set_brand_product, only: [:show, :update, :destroy]
  
    # GET /brands/:brand_id/brands
    def index
      json_response(@brand.products)
    end
  
    # GET /brands/:brands_id/products/:id
    def show
      json_response(@product)
    end
  
    # POST /brands/:brand_id/products
    def create
      @brand.products.create!(product_params)
      json_response(@brand, :created)
    end
  
    # PUT /brands/:brand_id/products/:id
    def update
      @product.update(product_params)
      head :no_content
    end
  
    # DELETE /brands/:brand_id/products/:id
    def destroy
      @product.destroy
      head :no_content
    end
  
    private
  
        def product_params
            params.permit(:name)
        end
    
        def set_brand
            @brand = Brand.find(params[:brand_id])
        end
    
        def set_brand_product
            @product = @brand.products.find_by!(id: params[:id]) if @brand
        end
end
