class AddUrlToPromoters < ActiveRecord::Migration
  def change
    add_column :promoters, :url, :string
  end
end
