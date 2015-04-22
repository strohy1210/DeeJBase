class AddSlugToPromoters < ActiveRecord::Migration
  def change
    add_column :promoters, :slug, :string
  end
end
