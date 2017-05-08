# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
response = HTTParty.get('https://data.cityofnewyork.us/resource/dnpn-ts5d.json')
rows = JSON.parse(response.body)
rows.each do |row|
	next if row.length == 0
	unit = Unit.find_or_create_by!(unit_type: row["measurement"])
	building = Building.find_or_create_by!(name: row["location_1_location"])
	 row.each do |key, value|
	 	if m = /\A([a-z]{3})_(\d{2})\z/.match(key)
	 		year = "20#{m[2]}".to_i
	 		measurement = Measurement.find_or_create_by!(unit: unit, building: building, year: year)
	 		measurement.quantity += value.to_f
	 		measurement.save!
	 	end
	 end
end