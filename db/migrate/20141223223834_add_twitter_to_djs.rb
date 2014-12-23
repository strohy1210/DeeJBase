class AddTwitterToDjs < ActiveRecord::Migration
  def change
    add_column :djs, :twitter_hdl, :string
  end
end
