class AddFilmFormatToUsers < ActiveRecord::Migration
  def change
    add_column :users, :film_format, :string
  end
end
