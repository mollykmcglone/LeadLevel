require('spec_helper')

describe(Contact) do
  describe("#users") do
    it("blah") do
      test_user = User.create({:user_name => "Matt"})
      test_contact = Contact.create({:user_id => test_user.id()})
      expect(test_contact.user()).to(eq(test_user))
    end
  end
end
