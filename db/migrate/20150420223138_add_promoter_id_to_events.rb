class AddPromoterIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :promoter_id, :integer
  end
end
