class CreatePreviousFilms < ActiveRecord::Migration
  def change
    create_table :previous_films do |t|
      t.references :user, index: true
      t.references :film, index: true
      t.string :film_format

      t.timestamps null: false
    end
    add_foreign_key :previous_films, :users, column: :user_id
    add_foreign_key :previous_films, :films, column: :film_id
  end
end
