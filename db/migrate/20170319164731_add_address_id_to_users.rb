class AddAddressIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :address, index: true
    add_foreign_key :users, :addresses, column: :address_id
  end
end