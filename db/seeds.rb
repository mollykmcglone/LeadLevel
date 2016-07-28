require './lib/contact.rb'
require './lib/place.rb'
require './lib/result.rb'
require './lib/user.rb'

place_list = [
  [ '400 SW 6th Avenue', 'Suite 900', 'Portland', 'Oregon', '97204', 'Harland Financial Solutions'],
  [ '400 SW 6th Avenue', 'Suite 600', 'Portland', 'OR', '', 'UTi'],
  ['3936 SE Sherman Street', 'Apartment 13', 'Portland', 'Oregon'],
  ['3936 SE Sherman Street', 'Apartment 5', 'Portland', 'Oregon'],
  ['3936 SE Sherman Street', 'Apartment 7', 'Portland', 'Oregon'],
  ['4026 SE Stark Street', 'Apartment 3', 'Portland', 'Oregon'],
  ['3444 SE Division Street', '', 'Portland', 'Oregon', '97214'],
  ['2276 SE 41st Avenue', '', 'Portland', 'Oregon', '97214', 'George Middle School', 'red']
]

user_list = [
  ['test_matthew', 'password'],
  ['user', 'password'],
  ['user2', 'password']
]

result_list = [
  ['Portland Water Bureau', 'true', '2016-06-15', '8', '1']
]

place_list.each do |address_line1, address_line2, city, state, zipcode, name, rating|
  Place.create( address_line1: address_line1, address_line2: address_line2, city: city, zipcode: zipcode, state: state, name: name, rating: rating)
end

user_list.each do |user_name, password|
  User.create( user_name: user_name, password: password)
end

result_list.each do |lab, over_limit, test_date, place_id, user_id|
  Result.create({:lab => lab, :over_limit => over_limit, :test_date => test_date, :place_id => place_id, :user_id => user_id})
end
