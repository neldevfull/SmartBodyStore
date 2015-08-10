class ProductsController < ApplicationController

	before_action :set_product, only: [:edit, :update, :destroy]
	
	def index 
		@products = Product.order('id DESC').limit 50
	end

	def search
		@name_search = params[:name]
		@products_search = Product.where "name like ?", "%#{@name_search}%"
	end
	
	def new
		@product = Product.new
		rendering :new
	end

	def create
		@product = Product.new product_params
		if @product.save
			flash[:notice] = "Successfully saved product"		 
			redirect_to root_path
		else
			rendering :new
		end
	end
	
	def edit		
		rendering :edit
	end

	def update			
		if @product.update product_params 
			flash[:notice] = "Successfully upgraded product"
			redirect_to root_path
		else
			rendering :edit
		end
	end

	def destroy			
		@product.destroy
		redirect_to root_url
	end

	private 

	def set_product
		@product = Product.find(params[:id])
	end

	def rendering(view)
		@departments = Department.all.order('name ASC')
		render view
	end

	def product_params
		params.require(:product)
			.permit :name, :description, :price, :amount, :department_id			
	end

end
