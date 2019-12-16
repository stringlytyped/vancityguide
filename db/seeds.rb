# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.new
admin.email = "admin@example.com"
admin.password = "password"
admin.password_confirmation = "password"
admin.admin = true
admin.save!

puts "Created default admin user"

poi1 = Poi.new
poi1.name = "Gastown Steam Clock"
poi1.rating = 4
poi1.price = "Free"
poi1.description = "Raymond Saunders' first steam clock was built in 1977 at the corner of Cambie and Water streets in Vancouver's Gastown neighbourhood, to deter people from sleeping on top of steam grate of distributed steam heating system in cold weather. [Wikipedia]"
poi1.category = :landmark
poi1.lat = 49.284463
poi1.lon = -123.108971
poi1.public = true
poi1.featured = true
poi1.owner = admin
poi1.save!

puts "Created sample POI #1"

poi1 = Poi.new
poi1.name = "Stanley Park"
poi1.rating = 5
poi1.website = "https://vancouver.ca/parks-recreation-culture/stanley-park.aspx"
poi1.price = "Free admission, but must pay for parking"
poi1.description = "Stanley Park is a 405-hectare (1,001-acre) public park that borders the downtown of Vancouver in British Columbia, Canada and is mostly surrounded by waters of Burrard Inlet and English Bay. Unlike other large urban parks, Stanley Park is not the creation of a landscape architect, but rather the evolution of a forest and urban space over many years. [Wikipedia]"
poi1.category = :nature
poi1.lat = 49.294748
poi1.lon = -123.136514
poi1.public = true
poi1.featured = true
poi1.owner = admin
poi1.save!

puts "Created sample POI #2"

poi1 = Poi.new
poi1.name = "Canada Place"
poi1.rating = 3
poi1.website = "https://www.canadaplace.ca/"
poi1.description = "Canada Place is a building situated on the Burrard Inlet waterfront of Vancouver, British Columbia. It is the home of the Vancouver Convention Centre, the Pan Pacific Vancouver Hotel, Vancouver's World Trade Centre, and the virtual flight ride FlyOver Canada [4]. The building's exterior is covered by fabric roofs resembling sails."
poi1.category = :landmark
poi1.lat = 49.288300
poi1.lon = -123.112379
poi1.public = true
poi1.featured = true
poi1.owner = admin
poi1.save!

puts "Created sample POI #2"