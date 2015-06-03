class AddPriorityToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :priority, :integer
  end
end
