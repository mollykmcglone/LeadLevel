class CreatePlacesUsers < ActiveRecord::Migration
  def change
    create_table(:places_users) do |t|
      t.column(:place_id, :int)
      t.column(:user_id, :int)
    end
  end
end
