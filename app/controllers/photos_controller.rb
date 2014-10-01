class PhotosController < ApplicationController
  def new
    @sale = Sale.find(params[:sale_id])
    @photos = @sale.photos.order('created_at DESC')
    @photo = Photo.new
  end
 
  def create
    @sale = Sale.find(params[:sale_id])
    @photo = @sale.photos.new(photo_params)
    if @photo.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: "New sale was added." }
        format.js
      end
    end
  end
 
  private
 
  def photo_params
    params.require(:photo).permit(:image, :sale_id)
  end
end