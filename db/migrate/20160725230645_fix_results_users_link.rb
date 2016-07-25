class FixResultsUsersLink < ActiveRecord::Migration
  def change
    add_column(:results, :user_id, :int)
    add_column(:results, :timestamp, :timestamp)
    drop_table(:results_users)
  end
end
