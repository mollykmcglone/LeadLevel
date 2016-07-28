require('pry')
require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  erb(:index)
end

get('/create') do
  erb(:user_form)
end

post('/user/new') do
  user_name = params.fetch('user_name')
  password = params.fetch('password')
  password_confirmation = params.fetch('password_confirmation')
  if password == password_confirmation
    user = User.new({:user_name => user_name, :password => password})
    if user.save()
      User.create({:user_name => user_name, :password => password})
      erb(:index)
    else
      @error = "cannot save"
      erb(:errors)
    end
  else
    @error = "passwords do not match"
    erb(:errors)
  end
end

get('/login') do
  erb(:login)
end


post('/login') do
  user_name = params.fetch('user_name')
  password = params.fetch('password')
  user = User.find_by(user_name: user_name)
  if user != nil
    if user.password() == password
      id = user.id
      redirect to("/loggedin/#{id}")
    else
      @error = "password entered in incorrectly"
      erb(:errors)
    end
  else
    @error = "user name not found"
    erb(:errors)
  end
end


get('/errors') do
  erb(:errors)
end

get('/loggedin/:id') do
  id = params.fetch('id').to_i()
  @user = User.find(id)
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

post('/loggedin/:id/places/name') do
  id = params.fetch('id').to_i()
  name = params['name']
  @place = Place.find_by(name: name)
  if @place != nil
    redirect("/loggedin/#{id}/places/".concat(@place.id().to_s()))
  else
    redirect to("/loggedin/#{id}/places/new")
  end
end

get('/loggedin/:id/places/new') do
  id = params.fetch('id').to_i()
  @user = User.find(id)
  erb(:places_form)
end

post('/places/address') do
  street_number = params['street_number']
  street_name = params['street_name']
  street_direction = params['street_direction']
  street_type = params['street_type']
  address = street_number.concat(" ").concat(street_direction).concat(" ").concat(street_name).concat(" ").concat(street_type)
  @@places = Place.where(address_line1: address.upcase())
  if @@places != []
    redirect('/places')
  else
    erb(:places_form)
  end
end

post('/loggedin/:id/places/address') do
  id = params.fetch('id').to_i()
  @user = User.find(id)
  street_number = params['street_number']
  street_name = params['street_name']
  street_direction = params['street_direction']
  street_type = params['street_type']
  address = street_number.concat(" ").concat(street_direction).concat(" ").concat(street_name).concat(" ").concat(street_type)
  @@places = Place.where(address_line1: address.upcase())
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

get('/logout') do
  erb(:loggedout)
end

get('/loggedin/profile/:id') do
  id = params.fetch('id').to_i()
  @user = User.find(id)
  @places = @user.places()
  erb(:profile)
end
