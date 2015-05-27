class AddRatedAtToPromotersFestivals < ActiveRecord::Migration
  def change
    add_column :promoters, :rated_at, :datetime
    add_column :festivals, :rated_at, :datetime
  end
end
