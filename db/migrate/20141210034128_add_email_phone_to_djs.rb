class AddEmailPhoneToDjs < ActiveRecord::Migration
  def change
    add_column :djs, :email, :string
    add_column :djs, :phone, :string
  end
end
