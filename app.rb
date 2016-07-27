require('pry')
require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

post('/places/name') do
  name = params['name']
  @place = Place.find_by(name: name)
  if @place != ''
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
  apt = params['apt']
  address = street_number.concat(street_name).concat(street_direction).concat(street_type).concat(apt)
  @new_place = Place.where(address_line1: address)
  if @new_place
    redirect('/places/'.concat(@new_place.id().to_s()))
  else
    erb(:places_form)
  end
end

get('/places/:id') do
  @place = Place.find(params['id'].to_i())
  erb(:places)
end

get('places/new') do
  erb(:places_form)
end
