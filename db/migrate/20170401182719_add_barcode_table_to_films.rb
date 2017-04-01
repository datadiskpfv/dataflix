class AddBarcodeTableToFilms < ActiveRecord::Migration
  def change
    add_column :films, :barcode_table, :string
  end
end
