# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'csv'
def load_files(model_file)
  model = model_file.chomp('.csv').constantize
  model.destroy_all
  CSV.foreach("db/production-examples/#{model_file}", headers: true) do |row|
    model.create(row.to_h)
  end
end

# DO NOT INVOKE find_files in Development!!
def find_files
  Dir.foreach('db/production-examples') do |fileName|
    next if fileName == '.' or fileName  == '..'
    load_files(fileName)
  end
end


def test
  Comment.destroy_all
  CSV.foreach('db/production-examples/Comment.csv', headers: true) do |row|
    Comment.create(row.to_h)
  end
end

find_files
