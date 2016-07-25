class CreateResults < ActiveRecord::Migration
  def change
    create_table(:results) do |t|
      t.column(:place_id, :int)
    end
  end
end
