class AddUidToDj < ActiveRecord::Migration
  def change
    add_column :djs, :uid, :string
  end
end
