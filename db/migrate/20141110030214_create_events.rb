class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.text :description
      t.belongs_to :dj
      t.belongs_to :venue
      
      t.timestamps
    end
  end
end
