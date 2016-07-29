class AddContactIdTo < ActiveRecord::Migration
  def change
      add_column(:users, :contact_id, :int)
  end
end
