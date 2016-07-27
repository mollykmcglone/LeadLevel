class User < ActiveRecord::Base
  has_many(:results)
  has_and_belongs_to_many(:places)
  has_many(:contacts)

  validates(:user_name, {:presence => true, :length => {:maximum => 50}})
  validates(:user_name, {:uniqueness => true})


end
