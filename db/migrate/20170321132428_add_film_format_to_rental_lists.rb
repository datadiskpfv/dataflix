class AddFilmFormatToRentalLists < ActiveRecord::Migration
  def change
    add_column :rental_lists, :film_format, :string
  end
end
