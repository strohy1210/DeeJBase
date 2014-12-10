class ChangeDemoTypeInDJs < ActiveRecord::Migration
  def change
    change_column :djs, :demo, :text
    remove_column :djs, :contact
  end
end
