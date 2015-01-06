class AddSlugToDjs < ActiveRecord::Migration
  def change
    add_column :djs, :slug, :string
  end
end
