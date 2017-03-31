class AddReleaseMonthToFilms < ActiveRecord::Migration
  def change
    add_column :films, :release_month, :string
  end
end
