class AddLocationToFestivals < ActiveRecord::Migration
  def change
    add_column :festivals, :location, :string
  end
end
