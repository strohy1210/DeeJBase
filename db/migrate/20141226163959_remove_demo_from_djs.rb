class RemoveDemoFromDjs < ActiveRecord::Migration
  def change
    remove_column :djs, :demo
  end
end
