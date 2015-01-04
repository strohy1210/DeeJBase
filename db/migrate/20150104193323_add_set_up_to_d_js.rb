class AddSetUpToDJs < ActiveRecord::Migration
  def change
    add_column :djs, :can_produce, :boolean, default: false
  end
end
