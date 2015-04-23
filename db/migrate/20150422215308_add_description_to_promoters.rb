class AddDescriptionToPromoters < ActiveRecord::Migration
  def change
    add_column :promoters, :description, :text
  end
end
