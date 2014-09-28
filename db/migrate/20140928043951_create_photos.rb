class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.integer :sale_id
    		t.belongs_to :sale
    end
    add_index :photos, :sale_id
  end
end
