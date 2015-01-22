class AddRatedAtToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :rated_at, :datetime
  end
end
