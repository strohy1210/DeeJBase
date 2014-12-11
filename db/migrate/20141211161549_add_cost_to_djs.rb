class AddCostToDjs < ActiveRecord::Migration
  def change
    add_column :djs, :rate_per_hour, :float
  end
end
