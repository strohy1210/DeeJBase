class AddRatedAtToDJs < ActiveRecord::Migration
  def change
    add_column :djs, :rated_at, :datetime
  end
end
