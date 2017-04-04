class AddBluRayWstockToFilm < ActiveRecord::Migration
  def change
    add_column :films, :blu_ray_wstock, :integer
  end
end
