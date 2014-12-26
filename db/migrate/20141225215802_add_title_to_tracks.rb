class AddTitleToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :title, :string
  end
end
