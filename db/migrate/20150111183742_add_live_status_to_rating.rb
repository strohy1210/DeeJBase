class AddLiveStatusToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :seen_live, :boolean
  end
end
