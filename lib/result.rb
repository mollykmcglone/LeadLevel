class Result < ActiveRecord::Base
  belongs_to(:places)
  belongs_to(:users)
end
