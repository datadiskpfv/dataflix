class CreateCounties < ActiveRecord::Migration
  def change
    create_table :counties do |t|
      t.string :county, index: true

      t.timestamps null: false
    end
  end
end