class Place < ActiveRecord::Base
  has_and_belongs_to_many(:users)
  has_many(:results)
  has_many(:contacts) 

end
