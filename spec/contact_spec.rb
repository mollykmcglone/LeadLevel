require('spec_helper')

describe(Contact) do
  describe("#user") do
    it("says which user belongs to a contact") do
      test_user = User.create({:user_name => "Matt", :password => "password"})
      test_contact = Contact.create({:user_id => test_user.id()})
      expect(test_contact.user()).to(eq(test_user))
    end
  end
end
