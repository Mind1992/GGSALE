class PhotosController < ApplicationController
  def new
    @sale = Sale.find(params[:sale_id])
    @photo = @sale.photos.new
    @photos = @sale.photos.order('created_at DESC')
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

  def destroy
    @sale = Sale.find(params[:sale_id])
    @photo = @sale.photos.find(params[:id])
    @photo.destroy
    respond_to do |format|
      format.html 
      format.js
    end 
  end

 
  private
 
  def photo_params
    params.require(:photo).permit(:image, :sale_id)
  end
end