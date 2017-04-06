class AddApprovalToFilmReview < ActiveRecord::Migration
  def change
    add_column :film_reviews, :approval, :boolean, default: false
  end
end