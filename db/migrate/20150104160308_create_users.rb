class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :venue_status, :default => false
      t.boolean :dj_status
      t.integer :sdcl_id
      t.string :uid
      t.string :image_url
      t.timestamps
    end
  end
end
