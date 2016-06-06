# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def convert_to_yml(yml_file)
 YAML.load_file(File.absolute_path(yml_file))
end

holes_yml = convert_to_yml('db/data/holes.yml')

holes_yml.each_pair do |name, info|
 Hole.create!(
   ID: name,
   date: info["date"],
   lat: info["lat"],
   lng: info["lng"],
   description: info["description"]
 )
end