class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
    	t.string :address
    	t.string :title
    	t.text :description
    	t.date :start_date
    	t.date :end_date
    	t.time :start_time
    	t.time :end_time
    	t.integer :user_id
    end
  end
end
