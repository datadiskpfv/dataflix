class AddHomeToRentalLists < ActiveRecord::Migration
  def change
    add_column :rental_lists, :home, :boolean, default: false
  end
end
