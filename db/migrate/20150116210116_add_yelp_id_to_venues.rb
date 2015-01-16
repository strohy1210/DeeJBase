class AddYelpIdToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :yelp_id, :string
  end
end
