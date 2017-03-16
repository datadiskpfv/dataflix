class RemoveTownFromAddress < ActiveRecord::Migration
  def change
    remove_column :addresses, :town, :string
  end
end
