class CreateContacts < ActiveRecord::Migration
  def change
    create_table(:contacts) do |t|
      t.column(:email_address, :string)
      t.column(:phone_number, :int)
      t.column(:contact_name, :string)
      t.column(:address_line1, :string)
      t.column(:address_line2, :string)
      t.column(:city, :string)
      t.column(:zipcode, :int)
      t.column(:state, :string)
    end
  end
end
