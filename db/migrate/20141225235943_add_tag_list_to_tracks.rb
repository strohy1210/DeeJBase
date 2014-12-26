class AddTagListToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :tag_list, :string
  end
end
