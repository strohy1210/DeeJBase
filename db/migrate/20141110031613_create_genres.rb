class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.belongs_to :dj
      t.timestamps
    end
  end
end
