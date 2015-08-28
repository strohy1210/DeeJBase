class ChangeAboutType < ActiveRecord::Migration
  def change
    change_column(:promoters, :about, :text)
    change_column(:festivals, :about, :text)
    change_column(:venues, :about, :text)
    remove_column(:promoters, :url)
    remove_column(:promoters, :description)
    drop_table :delayed_jobs
  end
end
