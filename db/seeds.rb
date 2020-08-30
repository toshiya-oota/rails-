# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

def import_csv(csv_path)
  filename = csv_path.basename('.csv').to_s
  class_name = filename[4..].classify
  model = Object.const_get(class_name)

  puts "==== START #{model.table_name} ===="
  CSV.foreach(csv_path.to_s, headers: true) do |row|
    next puts "exist record #{row[0]}" if model.exists?(id: row[0])

    if row[0].to_s.end_with?('00')
      print row[0]
    else
      print '.'
    end
    model.create!(row.to_hash)
  end
  puts
  puts "==== END #{model.table_name} ===="
end

Rails.
  root.
  join('db', 'seeds', 'csvs').
  glob('*.csv').
  sort.
  each { |csv_path| import_csv(csv_path) }
