class SalesController < ApplicationController
	def new
		@sale = Sale.new
	end

	def create
		@sale = Sale.new(sale_params)
		@sale.user_id = current_user.id
		if @sale.save
			redirect_to root_path, notice: "New sale was added."
		else
			'new'
		end
	end

	private
	
	def sale_params
		params.require(:sale).permit(:address, :title, :description, :start_date, :end_date, :start_time, :end_time, :user_id)
	end
end