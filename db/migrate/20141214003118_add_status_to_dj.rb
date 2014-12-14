class AddStatusToDj < ActiveRecord::Migration
  def change
    add_column :djs, :dj_status, :boolean
  end
end
