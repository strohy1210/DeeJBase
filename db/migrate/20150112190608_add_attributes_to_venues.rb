class AddAttributesToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :image_url, :string
    add_column :venues, :cross_streets, :string
    add_column :venues, :neighborhood, :string
    add_column :venues, :latitude, :float
    add_column :venues, :longitude, :float
    add_column :venues, :yelp_rating, :string
  end
end
