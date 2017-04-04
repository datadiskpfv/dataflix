class AddDvdWstockToFilm < ActiveRecord::Migration
  def change
    add_column :films, :dvd_wstock, :integer
  end
end
