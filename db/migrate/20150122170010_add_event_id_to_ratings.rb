class AddEventIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :event_id, :integer
  end
end
