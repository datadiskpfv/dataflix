class AddDvdStockToFilms < ActiveRecord::Migration
  def change
    add_column :films, :dvd_stock, :integer
  end
end
