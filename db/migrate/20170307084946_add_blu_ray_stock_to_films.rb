class AddBluRayStockToFilms < ActiveRecord::Migration
  def change
    add_column :films, :blu_ray_stock, :integer
  end
end
