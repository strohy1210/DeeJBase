class RemoveRatingsFromVenuesDjs < ActiveRecord::Migration
  def change
    remove_column :ratings, :dj_id
    remove_column :ratings, :venue_id
  end
end
