class ProductsController < ApplicationController
	def index 
		@products = Product.order(:price, :name).limit 5
	end

	def create
		values = params.require(:produto).permit!
		Product.create values
	end
end
