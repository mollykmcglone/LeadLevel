require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

post('/places/search') do
  address = params['address']
  @@new_places = Place.where(address_line1: address)
  if @@new_places
    redirect('/places/batches')
  else
    erb(:places_form)
  end
end

get('/places/batches') do
  @@new_places
  erb(:places_specify)
end
