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

delete('/places/:id') do
  place = Place.find(params.fetch('id').to_i)
  place.destroy()
  redirect('/')
end

get '/places/:id/edit' do
  @place = Place.find(params['id'].to_i())
  erb(:edit_places_form)
end

patch '/places/:id/edit' do
  @place = Place.find(params['id'].to_i())
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
  contact_email = params['contact_email']
  contact_phone = params['contact_phone']
  first_name = params['contact_first_name']
  last_name = params['contact_last_name']

  contact_id = @current_contact.id()
  @current_place = Place.new({name: name, address_line1: address, address_line2: address_line2, city: city, state: state, zipcode: zipcode, contact_id: contact_id})
  @current_place = Place.update({name: name, address_line1: address, address_line2: address_line2, city: city, state: state, zipcode: zipcode, contact_id: contact_id})
  erb(:edit_places_form)
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
  contact_email = params['contact_email']
  contact_phone = params['contact_phone']
  first_name = params['contact_first_name']
  last_name = params['contact_last_name']
  @new_contact = Contact.new(email_address: contact_email, phone_number: contact_phone, first_name: first_name, last_name: last_name)
  @new_contact.save()
  contact_id = @new_contact.id()
  @new_place = Place.new({name: name, address_line1: address, address_line2: address_line2, city: city, state: state, zipcode: zipcode, contact_id: contact_id})
  @new_place.save()

  if @new_place.save()
    redirect('/places/'.concat(@new_place.id().to_s()))
  else
    erb(:errors)
  end
end

post("/loggedin/:id/places/new") do
  id = params.fetch('id').to_i()
  @user = User.find(id)
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
  contact_email = params['contact_email']
  contact_phone = params['contact_phone']
  first_name = params['contact_first_name']
  last_name = params['contact_last_name']
  @new_contact = Contact.new(email_address: contact_email, phone_number: contact_phone, first_name: first_name, last_name: last_name)
  @new_contact.save()
  contact_id = @new_contact.id()
  @new_place = Place.new({name: name, address_line1: address, address_line2: address_line2, city: city, state: state, zipcode: zipcode, contact_id: contact_id, :user_id => id})
  @new_place.save()
  if @new_place.save()
    redirect("/loggedin/#{@user.id()}/places/".concat(@new_place.id().to_s()))
  else
    @error = 'something went wrong with the saving process'
    erb(:errors)
  end
end

get('/loggedin/:user_id/places/:id') do
  id = params.fetch('user_id').to_i()
  @user = User.find(id)
  @place = Place.find(params['id'].to_i())
  users = User.all()
  @users = []
  users.each() do |user|
    @users.push(user.user_name())
  end
  erb(:place)
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

get ('/result/:id/new') do
  @place = Place.find(params['id'].to_i())
  erb(:result_form)
end

get ('/loggedin/:user_id/result/:id/new') do
  id = params.fetch('user_id').to_i()
  @user = User.find(id)
  @place = Place.find(params['id'].to_i())
  erb(:result_form)
end

post('/result/:id') do
  test_date = params['test_date']
  lab = params['lab']
  over_limit = params['over_limit']
  @place = Place.find(params['id'].to_i())
  @result = Result.new({test_date: test_date, lab: lab, over_limit: over_limit, place_id: @place.id})
  if @result.save()
    if @result.over_limit == false
      @place.rating = "green"
      @place.save()
    else
      @place.rating = "red"
      @place.save()
    end
    redirect("/places/".concat(@place.id().to_s()))
  else
    erb(:errors)
  end
end

post('/loggedin/:user_id/result/:id') do
  id = params.fetch('user_id').to_i()
  @user = User.find(id)
  test_date = params['test_date']
  lab = params['lab']
  over_limit = params['over_limit']
  @place = Place.find(params['id'].to_i())
  @result = Result.new({test_date: test_date, lab: lab, over_limit: over_limit, place_id: @place.id, user_id: @user.id()})
  binding.pry
  if @result.save()
    if @result.over_limit = true
      @place = Place.find(@result.place_id)
      @place.rating = "red"
    else
      @place = Place.find(@result.place_id)
      @place.rating = "green"
    end
    redirect("/loggedin/#{id}/places/".concat(@place.id().to_s()))
  else
    erb(:errors)
  end
end
