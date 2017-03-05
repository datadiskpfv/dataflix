class AddImage1ToFilms < ActiveRecord::Migration
  def change
    add_column :films, :image1, :string
  end
end
