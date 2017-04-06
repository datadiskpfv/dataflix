class AddFilmToFilmReview < ActiveRecord::Migration
  def change
    add_reference :film_reviews, :film, index: true
    add_foreign_key :film_reviews, :films, column: :film_id
  end
end