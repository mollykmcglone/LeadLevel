require('pry')
require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

post('/places/name') do
  name = params['name'].upcase()
  @place = Place.find_by(name: name)
  if @place != nil
    redirect('/places/'.concat(@place.id().to_s()))
  else
    erb(:places_form)
  end
end

post('/places/address') do
  street_number = params['street_number']
  street_name = params['street_name']
  street_direction = params['street_direction']
  street_type = params['street_type']
  address = street_number.concat(" ").concat(street_direction).concat(" ").concat(street_name).concat(" ").concat(street_type)
  address.upcase()
  @@places = Place.where(address_line1: address)
  if @@places != []
    redirect('/places')
  else
    erb(:places_form)
  end
end

get('/places/:id') do
  @place = Place.find(params['id'].to_i())
  erb(:place)
end

get('/places') do
  @@places
  erb(:places)
end

get('places/new') do
  erb(:places_form)
end

post("/places/new") do
  name = params['name']
  street_number = params['street_number']
  street_name = params['street_name']
  street_direction = params['street_direction']
  street_type = params['street_type']
  apt = params['apt']
  suite = params['suite']
  city = params['city']
  state = params['state']
  zipcode = params['zipcode']
  address = street_number.concat(" ").concat(street_direction).concat(" ").concat(street_name).concat(" ").concat(street_type)
  if apt != nil
    address_line2 = apt
  elsif suite != nil
    address_line2 = suite
  else
    address_line2 = nil
  end
  @new_place = Place.new({name: name, address_line1: address, address_line2: address_line2, city: city, state: state, zipcode: zipcode})
  @new_place.save()

  if @new_place.save()
    redirect('/places/'.concat(@new_place.id().to_s()))
  else
    erb(:errors)
  end
end



post('/places/:id/results') do
  test_date = params['test_date']
  lab = params['lab']
  over_limit = params['over_limit']
  user_id = params['user_id']
  place_id = params['place_id']
  @result = Result.create({test_date: test_date, lab: lab, over_limit: over_limit, user_id: user_id, place_id: place_id})
  if @result.over_limit = true
    place = Place.find(@result.place_id)
    place.rating = "red"
  else
    place = Place.find(@result.place_id)
    place.rating = "green"
  end
  
end
