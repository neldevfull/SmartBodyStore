class ProductsController < ApplicationController
	def index 
		@products = Product.order(:price, :name).limit 5
	end
end
