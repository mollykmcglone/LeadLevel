require('spec_helper')

describe(Contact) do
  describe("#user") do
    it("says which user belongs to a contact") do
      test_user = User.create({:user_name => "Matt", :password => "password"})
      test_contact = Contact.create({:user_id => test_user.id()})
      expect(test_contact.user()).to(eq(test_user))
    end
  end
  describe("#places") do
    it("says which places are associated with a contact") do
      test_place = Place.create({:address_line1 => "400 SW 6th Avenue", :city => 'Portland', :state => 'Oregon'})
      test_contact = Contact.create({email_address: "blah@gmail.com", phone_number: "555-555-5555", first_name: "matthew", last_name: "giem"})
      test_contact.places.push(test_place)
      expect(test_contact.places()).to(eq([test_place]))
    end
  end

end
