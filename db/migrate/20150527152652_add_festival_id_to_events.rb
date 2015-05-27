class AddFestivalIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :festival_id, :integer
    add_column :festivals, :image_url, :string
    add_column :promoters, :image_url, :string
  end
end
