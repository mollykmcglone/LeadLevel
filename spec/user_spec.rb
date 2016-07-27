require('spec_helper')

describe(User) do
  describe('#contact') do
    it("belongs to a contact") do
      test_user = User.create({:user_name => "Molly", :password => "password"})
      test_contact = Contact.create({:email_address => "Molly@gmail.com", :user_id => test_user.id()})
      expect(test_user.contacts()).to(eq([test_contact]))
    end
  end

  describe("#result") do
    it("has many results") do
      test_place = Place.create({:city => "Portland"})
      test_user = User.create({:user_name => "Molly", :password => "password"})
      test_result = Result.create({:place_id => test_place.id(), :user_id => test_user.id()})
      expect(test_user.results()).to(eq([test_result]))
    end
  end

  describe("#place") do
    it("has many places") do
      test_user = User.create({:user_name => "Molly", :password => "password"})
      test_place = Place.create({:city => ["Portland"]})
      test_user.places.push(test_place)
      expect(test_user.places()).to(eq([test_place]))
    end
  end

  describe("user_name length constraint") do
    it("cannot be longer than 50 characters") do
      test_user = User.new({:user_name => "MollyMollyMollyMollyMollyMollyMollyMollyMollyMollyMolly", :password => "password"})
      expect(test_user.save()).to(eq(false))
    end
  end

  describe("#user_name_validation") do
    it("user_name must not be blank for it to be saved") do
      test_user = User.new({:user_name => ""})
      expect(test_user.save()).to(eq(false))
    end
  end

  describe('#password_validation') do
    it('must be more than 6 characters and less than 20') do
      test_user = User.new({:password => "hello", :user_name => "matt"})
      expect(test_user.save()).to(eq(false))
    end
  end

  describe('#password_validation') do
    it('must be more than 6 characters and less than 20') do
      test_user = User.new({:password => "howmanylettersmake20idkidkidkidk", :user_name => "matt"})
      expect(test_user.save()).to(eq(false))
    end
  end
end
