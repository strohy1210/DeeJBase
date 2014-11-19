class CreateDjs < ActiveRecord::Migration
  def change
    create_table :djs do |t|
      t.string :name
      t.string :image_url
      t.string :demo
      t.text :bio
      t.timestamps
    end
  end
end
