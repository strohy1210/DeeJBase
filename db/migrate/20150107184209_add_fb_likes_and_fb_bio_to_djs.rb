class AddFbLikesAndFbBioToDjs < ActiveRecord::Migration
  def change
    add_column :djs, :fb_likes, :integer
    add_column :djs, :fbpage_id, :string
    add_column :djs, :fb_bio, :text
  end
end
