class CreateFilmReviews < ActiveRecord::Migration
  def change
    create_table :film_reviews do |t|
      t.references :user, index: true
      t.integer :star_rating
      t.text :comments

      t.timestamps null: false
    end
    add_foreign_key :film_reviews, :users, column: :user_id
  end
end