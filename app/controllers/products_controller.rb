class ProductsController < ApplicationController
	
	def index 
		@products = Product.order('id DESC').limit 50
	end

	def search
		@name_search = params[:name]
		@products_search = Product.where "name like ?", "%#{@name_search}%"
	end

	def create
		Product.create params_permit		
		redirect_to root_url
	end

	def destroy
		Product.destroy(params[:id])
		redirect_to root_url
	end

	def params_permit
		params.require(:product)
			.permit :name, :description, :price, :amount			
	end

end
