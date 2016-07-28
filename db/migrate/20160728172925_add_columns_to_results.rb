class AddColumnsToResults < ActiveRecord::Migration
  def change
    add_column(:results, :test_date, :date)
    add_column(:results, :lab, :string)
    add_column(:results, :over_limit, :boolean)
  end
end
