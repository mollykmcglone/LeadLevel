class FixContactLinks < ActiveRecord::Migration
  def change
    add_column(:users, :contact_id, :int)

    drop_table(:contacts_users)
  end
end
