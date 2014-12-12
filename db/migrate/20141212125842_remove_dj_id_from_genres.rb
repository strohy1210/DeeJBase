class RemoveDjIdFromGenres < ActiveRecord::Migration
  def change
    remove_column :genres, :dj_id
  end
end
