class AddGenre2ToFilms < ActiveRecord::Migration
  def change
    add_reference :films, :genre2, index: true
    add_foreign_key :films, :genres, column: :genre2_id
  end
end