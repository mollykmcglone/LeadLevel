require './lib/contact.rb'
require './lib/place.rb'
require './lib/result.rb'
require './lib/user.rb'

place_list = [
  [ '400 SW 6th Ave', 'Suite 900', 'Portland', 'Oregon', '97204', 'Harland Financial Solutions'],
  [ '400 SW 6th Ave', 'Suite 600', 'Portland', 'OR', '', 'UTi'],
  ['3936 SE Sherman Street', 'Apartment 13', 'Portland', 'Oregon', '', ''],
  ['3936 SE Sherman Street', 'Apartment 5', 'Portland', 'Oregon', '', ''],
  ['3936 SE Sherman Street', 'Apartment 7', 'Portland', 'Oregon', '', ''],
  ['4026 SE Stark Street', 'Apartment 3', 'Portland', 'Oregon', '', '']
]


place_list.each do |address_line1, address_line2, city, state, zipcode, name|
  Place.create( address_line1: address_line1, address_line2: address_line2, city: city, zipcode: zipcode, state: state, name: name)
end
