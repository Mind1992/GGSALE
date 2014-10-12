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
		@hash = Gmaps4rails.build_markers(@sale) do |sale, marker|
  		marker.lat sale.latitude
  		marker.lng sale.longitude
  		marker.picture({
  			"url" => view_context.image_path('google_map_icon.png'),
  			"width" => 64,
  			"height" => 64
  			})
		end
	end

	def update
		@sale = Sale.find(params[:id])
		@photos = @sale.photos
		@sale.update(sale_params)
	end

	def favorite
		@sale = Sale.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @sale
      redirect_to :back, notice: "You favorited #{@sale.title}"

    elsif type == "unfavorite"
      current_user.favorites.delete(@sale)
      redirect_to :back, notice: "Unfavorited #{@sale.title}"

    else
      redirect_to :back, notice: 'Nothing happened.'
    end
  end

  def search
  	if params[:address].present?
      @sales = Sale.near(params[:address])
    else
      @sales = Sale.all
    end
    @hash = Gmaps4rails.build_markers(@sales) do |sale, marker|
  		marker.lat sale.latitude
  		marker.lng sale.longitude
  		marker.infowindow render_to_string(:partial => "/sales/my_template", :locals =>{ :sale => sale }) 
  		marker.picture({
  			"url" => view_context.image_path('google_map_icon.png'),
  			"width" => 64,
  			"height" => 64
  			})
  	end
  end

	private

	def sale_params
		params.require(:sale).permit(:address, :title, :description, :start_date, :end_date, :start_time, :end_time, :user_id)
	end  
end
