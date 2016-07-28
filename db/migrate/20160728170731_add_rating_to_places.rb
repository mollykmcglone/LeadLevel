class AddRatingToPlaces < ActiveRecord::Migration
  def change
    add_column(:places, :rating, :string)
  end
end
