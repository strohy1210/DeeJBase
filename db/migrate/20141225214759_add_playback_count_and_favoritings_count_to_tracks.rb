class AddPlaybackCountAndFavoritingsCountToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :playback_count, :integer
    add_column :tracks, :favoritings_count, :integer
  end
end
