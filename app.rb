require('pry')
require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

post('/places') do
  address = params['address']
  name = params['name']
  @@new_places = Place.where(address_line1: address)
  if @@new_places
    redirect('/places')
  else
    @@new_places = Place.where(name: name)
    if @@new_places
      redirect('/places')
    else
      ('/places/new')
    end
  end
end

get('/places') do
  @@new_places
  erb(:places)
end

get('places/new') do
  erb(:places_form)
end
