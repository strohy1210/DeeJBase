class AddPastVenuesToDjs < ActiveRecord::Migration
  def change
    add_column :djs, :past_venues, :string
  end
end
