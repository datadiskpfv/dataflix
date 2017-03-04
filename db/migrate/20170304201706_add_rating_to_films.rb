class AddRatingToFilms < ActiveRecord::Migration
  def change
    add_reference :films, :rating, index: true
    add_foreign_key :films, :ratings, column: :rating
  end
end