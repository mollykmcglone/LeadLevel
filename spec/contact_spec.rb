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
      test_contact = Contact.create({email_address: email_address, phone_number: phone_number, first_name: first_name, :last_name, last_name})
      test_contact.places.push(test_place)
      expect(test_contact.places()).to(eq([test_place]))
    end
  end

end
