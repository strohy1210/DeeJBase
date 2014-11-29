class AddContactToDjs < ActiveRecord::Migration
  def change
    add_column :djs, :contact, :string
  end
end
