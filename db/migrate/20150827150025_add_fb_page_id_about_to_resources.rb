class AddFbPageIdAboutToResources < ActiveRecord::Migration
  def change
    add_column :festivals, :fbpage_id, :string
    add_column :festivals, :about, :string
    add_column :festivals, :fb_photo, :string
    add_column :venues, :fbpage_id, :string
    add_column :venues, :about, :string
    add_column :venues, :fb_photo, :string
    add_column :promoters, :fbpage_id, :string
    add_column :promoters, :about, :string
    add_column :promoters, :fb_photo, :string
  end
end
