require('spec_helper')

describe(User) do
  describe('#contact') do
    it("belongs to a contact") do
      test_user = User.create({:user_name => "Molly"})
      test_contact = Contact.create({:email_address => "Molly@gmail.com", :user_id => test_user.id()})
      expect(test_user.contacts()).to(eq([test_contact]))
    end
  end

  describe("#results") do
    it("lets you see the results created by the user") do
      test_place = Place.create({:city => "Portland"})
      test_user = User.create({:user_name => "Molly"})
      test_result = Result.create({:lab => 'Pixis Laboratory', :over_limit => 'true', :place_id => test_place.id(), :test_date => '2016-05-05', user_id: test_user.id()})
      test_user.results.push(test_result)
      expect(test_user.results()).to(eq([test_result]))
    end
  end

  describe("#place") do
    it("has many places") do
      test_user = User.create({:user_name => "Molly"})
      test_place = Place.create({:address_line1 => "400 SW 6th Avenue", :city => 'Portland', :state => 'Oregon'})
      test_user.places.push(test_place)
      expect(test_user.places()).to(eq([test_place]))
    end
  end

  describe("user_name length constraint") do
    it("cannot be longer than 50 characters") do
      test_user = User.new({:user_name => "MollyMollyMollyMollyMollyMollyMollyMollyMollyMollyMolly"})
      expect(test_user.save()).to(eq(false))
    end
  end
end
