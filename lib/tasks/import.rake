require 'csv'

namespace :import do
  desc "import sml_category from csv"

  task sml_categories: :environment do
    path = File.join Rails.root, "db/csv/sml_category.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true)do |row|
      list << {
        id: row['id'],
        name: row['name'],
        created_at: row['created_at'],
        updated_at: row['updated_at']
      }
    end
    puts "start to create sml_category data"
    begin
      SmlCategory.create!(list)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute"
    end
  end
end