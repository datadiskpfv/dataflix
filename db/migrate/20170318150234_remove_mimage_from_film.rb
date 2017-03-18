class RemoveMimageFromFilm < ActiveRecord::Migration
  def change
    remove_column :films, :mimage, :string
  end
end
