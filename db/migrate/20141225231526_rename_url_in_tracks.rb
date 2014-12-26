class RenameUrlInTracks < ActiveRecord::Migration
  def change
    rename_column :tracks, :url, :demo
  end
end
