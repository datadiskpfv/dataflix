class AddGenre1ToFilms < ActiveRecord::Migration
  def change
    add_reference :films, :genre1, index: true
    add_foreign_key :films, :genres, column: :genre1_id
  end
end