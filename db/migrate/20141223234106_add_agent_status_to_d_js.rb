class AddAgentStatusToDJs < ActiveRecord::Migration
  def change
    add_column :djs, :agent_status, :boolean, :default => false
  end
end
