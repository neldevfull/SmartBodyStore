class Product < ActiveRecord::Base

	belongs_to :department
	
	validates :name, length: { 	minimum: 5 }
	validates :amount, presence: true	
end
