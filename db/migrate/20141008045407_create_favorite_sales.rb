class CreateFavoriteSales < ActiveRecord::Migration
  def change
    create_table :favorite_sales do |t|
      t.integer :sale_id
      t.integer :user_id

      t.timestamps
    end
  end
end
