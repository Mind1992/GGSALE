class SalesController < ApplicationController
	def index
		@sales = Sale.all
	end

	def new
		@sale = Sale.new
		@sale.photos.build
	end

	def create
		respond_to do |format|
			@sale = Sale.new(sale_params)
			@sale.user_id = current_user.id
		  @sale.save
			format.html { redirect_to root_path, notice: "New sale was added." }
			format.js
		end
	end

	def show
		@sale = Sale.find(params[:id])
	end

	private

	def sale_params
		params.require(:sale).permit(:address, :title, :description, :start_date, :end_date, :start_time, :end_time, :user_id, photos_attributes: [:id, :image, :sale_id])
	end

  
end
