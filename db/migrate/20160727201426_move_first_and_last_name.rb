class MoveFirstAndLastName < ActiveRecord::Migration
  def change
    remove_column(:contacts, :contact_name)
    add_column(:contacts, :first_name, :string)
    add_column(:contacts, :last_name, :string)
    add_column(:contacts, :user_id, :integer)
    add_column(:places, :contact_id, :integer)
    remove_column(:users, :last_name)
    remove_column(:users, :first_name)
    remove_column(:users, :contact_id)
    remove_column(:places, :contacts_id)


  end
end
