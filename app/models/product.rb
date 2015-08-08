class Product < ActiveRecord::Base
	
	validates :amount, presence: true	
end
