class ChangeFilmFormatToUsers < ActiveRecord::Migration
  def up
    change_column :users, :film_format, :string, default: 'blu-ray'
  end

  def down
    change_column :users, :film_format, :string, default: nil
  end
end