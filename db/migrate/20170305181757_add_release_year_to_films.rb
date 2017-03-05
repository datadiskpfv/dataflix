class AddReleaseYearToFilms < ActiveRecord::Migration
  def change
    add_column :films, :release_year, :string
  end
end
