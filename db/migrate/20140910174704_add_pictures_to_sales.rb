class AddPicturesToSales < ActiveRecord::Migration
  def change
  	add_attachment :sales, :picture
  end
end
