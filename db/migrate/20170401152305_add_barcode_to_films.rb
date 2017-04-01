class AddBarcodeToFilms < ActiveRecord::Migration
  def change
    add_column :films, :barcode, :integer, limit: 8
  end
end