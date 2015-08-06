class ProductsController < ApplicationController
	def index 
		@products = Product.order(:id, :price, :name).limit 20
	end

	def create
		Product.create params_permit		
	end

	def params_permit
		params.require(:product)
			.permit :name, :description, :price, :amount			
	end
end
