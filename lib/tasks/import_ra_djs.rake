require 'csv'
# namespace :import_all_djs do
#   task :create_djs => :environment do
#     csv_text = File.read('ra_djs.csv')
#     csv = CSV.parse(csv_text, :headers => true)
#     csv.each do |row|

#       Dj.create_adhoc_dj(row[0])
#     end
#   end
# end