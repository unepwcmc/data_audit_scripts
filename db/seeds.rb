# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

source = File.join(Rails.root, 'lib', 'data', 'column_matches.csv')

CSV.foreach(source, headers: true) do |row|
  ColumnMatch.create!(row.to_hash)
end