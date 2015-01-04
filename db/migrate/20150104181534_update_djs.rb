class UpdateDjs < ActiveRecord::Migration
  def change
    remove_column :djs, :rate_per_hour
    add_column :djs, :rate, :string
  end
end
