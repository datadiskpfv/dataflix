class AddMimageToFilms < ActiveRecord::Migration
  def change
    add_column :films, :mimage, :string
  end
end
