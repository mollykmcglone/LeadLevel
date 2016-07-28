class Place < ActiveRecord::Base
  has_and_belongs_to_many(:users)
  has_many(:results)
  belongs_to(:contact)
  validates(:address_line1, :city, :state, :presence => true)
  before_save(:upcase_name)
  before_save(:upcase_city)
  before_save(:upcase_state)
  before_save(:upcase_address_line1)

private
  define_method(:upcase_name) do
    if self.name
      self.name =name.upcase
    end
  end

  define_method(:upcase_city) do
    self.city=(city().upcase())
  end

  define_method(:upcase_state) do
    self.state=(state().upcase())
  end

  define_method(:upcase_address_line1) do
    self.address_line1=(address_line1().upcase())
  end
end
