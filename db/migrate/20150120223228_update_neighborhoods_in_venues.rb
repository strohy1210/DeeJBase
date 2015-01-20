class UpdateNeighborhoodsInVenues < ActiveRecord::Migration
  def change
    rename_column :venues, :neighborhood, :hood
    add_column :venues, :neighborhood_id, :integer
  end
end
