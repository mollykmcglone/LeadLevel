require('spec_helper')

describe(Result) do
  describe('#validates') do
    it("validates presence of test_date") do
      result = Result.new({:lab => 'Pixis Laboratory', :over_limit => 'true', :place_id => '4', :test_date => nil})
      expect(result.save()).to(eq(false))
    end
  end

  describe('#place') do
    it("says which place a result belongs to") do
      test_place = Place.create({:address_line1 => "400 SW 6th Avenue", :city => 'Portland', :state => 'Oregon'})
      result = Result.create({:lab => 'Pixis Laboratory', :over_limit => 'true', :test_date => '2016-05-05', :place_id => test_place.id})
      expect(result.place()).to(eq(test_place))
    end
  end

  describe('#user') do
    it("says which user posted a result") do
      test_user = User.create({:user_name => "Molly"})
      test_place = Place.create({:address_line1 => "400 SW 6th Avenue", :city => 'Portland', :state => 'Oregon'})
      result = Result.create({:lab => 'Pixis Laboratory', :over_limit => 'true', :test_date => '2016-05-05', :user_id => test_user.id, :place_id => test_place.id})
      expect(result.user()).to(eq(test_user))
    end
  end
end
