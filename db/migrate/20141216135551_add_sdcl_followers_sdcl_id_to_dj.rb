class AddSdclFollowersSdclIdToDj < ActiveRecord::Migration
  def change
    add_column :djs, :sdcl_followers, :integer
    add_column :djs, :sdcl_id, :integer
    add_column :djs, :city, :string

  end
end
