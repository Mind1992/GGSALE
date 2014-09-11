class SalesController < ApplicationController
	def index
		@sales = Sale.all
	end

	def new
		@sale = Sale.new
	end

	def create
		@sale = Sale.new(sale_params)
		@sale.user_id = current_user.id
		if @sale.save
			respond_to do |format|
			 format.html { redirect_to root_path, notice: "New sale was added." }
			 format.js
			end
		else
			'new'
		end
	end

	def show 
		@sale = Sale.find(params[:id])
	end

	private
	
	def sale_params
		params.require(:sale).permit(:address, :title, :description, :start_date, :end_date, :start_time, :end_time, :user_id, :picture)
	end
end