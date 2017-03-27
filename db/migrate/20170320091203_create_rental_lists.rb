class CreateRentalLists < ActiveRecord::Migration
  def change
    create_table :rental_lists do |t|
      t.references :user, index: true
      t.references :film, index: true

      t.timestamps null: false
    end
    add_foreign_key :rental_lists, :users, column: :user_id
    add_foreign_key :rental_lists, :films, column: :film_id
  end
end