class CreateResultsUsers < ActiveRecord::Migration
  def change
    create_table(:results_users) do |t|
      t.column(:result_id, :int)
      t.column(:user_id, :int)
    end
  end
end
