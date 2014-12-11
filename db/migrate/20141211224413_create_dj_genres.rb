class CreateDjGenres < ActiveRecord::Migration
  def change
    create_table :dj_genres do |t|
      t.belongs_to :dj
      t.belongs_to :genre
      t.timestamps
    end
  end
end
