class AddRatingIdToComments < ActiveRecord::Migration
  def change
    remove_column :comments, :dj_id
    remove_column :comments, :user_id
    remove_column :comments, :venue_id
    add_column :comments, :rating_id, :integer
    add_column :ratings, :user_id, :integer
    add_column :ratings, :venue_id, :integer
  end
end
