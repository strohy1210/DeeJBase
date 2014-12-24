class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :url
      t.integer :dj_id
    end
  end
end
