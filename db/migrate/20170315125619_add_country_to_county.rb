class AddCountryToCounty < ActiveRecord::Migration
  def change
    add_reference :counties, :country, index: true
    add_foreign_key :counties, :countries
  end
end
