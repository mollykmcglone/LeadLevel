require('spec_helper')

describe(Place) do
  describe('#users') do
    it("has many users") do
      test_place = Place.create({:address_line1 => "400 SW 6th Avenue"})
      test_user1 = User.create({:user_name => "Molly", :password => "123456"})
      test_user2 = User.create({:user_name => "Holly", :password => "123456"})
      test_place.users.push(test_user1, test_user2)
      expect(test_place.users()).to(eq([test_user1, test_user2]))
    end
  end

  describe("#results") do
    it("has many results") do
      test_place = Place.create({:address_line1 => "400 SW 6th Avenue"})
      test_result = Result.create({:place_id => test_place.id()})
      expect(test_place.results()).to(eq([test_result]))
    end
  end

  describe("#contact") do
    it("belongs to a contact") do
      test_contact = Contact.create({:email_address => "abc@example.com"})
      test_place = Place.create({:address_line1 => "400 SW 6th Avenue", :contact_id => test_contact.id()})
      expect(test_place.contact()).to(eq(test_contact))
    end
  end
end
