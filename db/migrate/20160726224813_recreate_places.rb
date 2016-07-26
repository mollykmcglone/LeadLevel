class RecreatePlaces < ActiveRecord::Migration
  def change
    create_table(:places) do |t|
      t.column(:address_line1, :string)
      t.column(:address_line2, :string)
      t.column(:city, :string)
      t.column(:zipcode, :int)
      t.column(:state, :string)
      t.column(:contacts_id, :int)
      t.column(:user_id, :int)
      t.column(:name, :string)
    end
  end
end
