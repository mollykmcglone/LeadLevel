class AddUserIdsToPlaces < ActiveRecord::Migration
  def change
    add_column(:places, :user_id, :int)
  end
end
