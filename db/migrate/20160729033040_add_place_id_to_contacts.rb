class AddPlaceIdToContacts < ActiveRecord::Migration
  def change
    add_column(:contacts, :place_id, :int)
  end
end
