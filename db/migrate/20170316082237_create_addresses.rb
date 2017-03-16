class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :house_name
      t.string :house_number
      t.string :address1
      t.string :address2
      t.string :town
      t.string :city
      t.references :postcode, index: true
      t.references :county, index: true
      t.references :country, index: true

      t.timestamps null: false
    end
    add_foreign_key :addresses, :postcodes
    add_foreign_key :addresses, :counties
    add_foreign_key :addresses, :countries
  end
end
