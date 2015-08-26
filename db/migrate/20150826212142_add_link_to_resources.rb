class AddLinkToResources < ActiveRecord::Migration
  def change
    add_column :festivals, :link, :string
    add_column :promoters, :link, :string
    add_column :venues, :link, :string
  end
end
