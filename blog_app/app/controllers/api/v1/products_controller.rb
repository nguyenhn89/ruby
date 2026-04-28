module Api
  module V1
    class ProductsController < BaseController
      def index
        products = Product.all
        # pp products
        # Rails.logger.info "test nguyen"
        # Rails.logger.debug "=== Products: #{products.to_json}"
        render json: products
      end

      def show
        product = Product.find(params[:id])
        render json: product
      end
    end
  end
end
