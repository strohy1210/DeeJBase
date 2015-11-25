require 'csv'
namespace :import_remote_db do
  task :backup_venues => :environment do
    if Rails.env.development? 
      # heroku pg:psql --app better-health
      # \copy (SELECT * FROM venues) TO z-remote-backup/all_venues_remote_6-23-15.csv DELIMITER ',' CSV HEADER;
      Venue.destroy_all
      csv_text = File.read('z-remote-backup/all_venues_remote_11-23-15.csv')
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        Venue.create!(row.to_hash)
      end
    end 
  end
end 

namespace :import_remote_db do
  task :backup_users => :environment do
    if Rails.env.development? 
    # \copy (SELECT * FROM users) TO z-remote-backup/all_users_remote_11-9-15.csv DELIMITER ',' CSV HEADER;
      User.destroy_all
      csv_text = File.read('z-remote-backup/all_users_remote_11-9-15.csv')
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        User.create!(row.to_hash)
      end
    end
  end
end 
namespace :import_remote_db do
  task :backup_promoters => :environment do
    if Rails.env.development? 
    # \copy (SELECT * FROM promoters) TO z-remote-backup/all_promoters_remote_11-9-15.csv DELIMITER ',' CSV HEADER; 
      csv_text = File.read('z-remote-backup/all_promoters_remote_11-9-15.csv')
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        Promoter.create!(row.to_hash)
      end
    end
  end
end 
namespace :import_remote_db do
  task :backup_events => :environment do
    if Rails.env.development? 
    # \copy (SELECT * FROM events) TO z-remote-backup/all_events_remote_11-9-15.csv DELIMITER ',' CSV HEADER; 
      csv_text = File.read('z-remote-backup/all_events_remote_11-9-15.csv')
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        Event.create!(row.to_hash)
      end
    end
  end
end 
namespace :import_remote_db do
  task :backup_ratings => :environment do
    if Rails.env.development? 
    # \copy (SELECT * FROM ratings) TO z-remote-backup/all_ratings_remote_11-9-15.csv DELIMITER ',' CSV HEADER; 
      csv_text = File.read('z-remote-backup/all_ratings_remote_11-9-15.csv')
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        Rating.create!(row.to_hash)
      end
    end
  end
end 
 
namespace :import_remote_db do
  task :backup_comments => :environment do
    if Rails.env.development? 
    # \copy (SELECT * FROM comments) TO z-remote-backup/all_comments_remote_11-9-15.csv DELIMITER ',' CSV HEADER; 
      csv_text = File.read('z-remote-backup/all_comments_remote_11-9-15.csv')
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        Comment.create!(row.to_hash)
      end
    end
  end
end 
