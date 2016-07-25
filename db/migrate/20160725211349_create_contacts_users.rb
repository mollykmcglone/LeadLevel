class CreateContactsUsers < ActiveRecord::Migration
  def change
    create_table(:contacts_users) do |t|
      t.column(:contact_id, :int)
      t.column(:user_id, :int)
    end
  end
end
