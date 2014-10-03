class SalesController < ApplicationController
	def index
		@sales = Sale.all
	end

	def new
		@sale = Sale.new
		@sale.photos.build
	end

	def create
		@sale = Sale.new(sale_params)
		@sale.user_id = current_user.id
		if @sale.save
			respond_to do |format|
				format.html { redirect_to new_sale_photo_path(@sale) }
				format.js
			end
		else
			'new'
		end
	end

	def show
		@sale = Sale.find(params[:id])
	end

	def update
		@sale = Sale.find(params[:id])
		@photos = @sale.photos
		@sale.update(sale_params)
	end


	private

	def sale_params
		params.require(:sale).permit(:address, :title, :description, :start_date, :end_date, :start_time, :end_time, :user_id)
	end

  
end
