class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
    	t.integer :sale_id
    	t.timestamps
    end
    add_attachment :pictures, :picture
  end
end
