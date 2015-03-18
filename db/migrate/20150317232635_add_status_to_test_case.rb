class AddStatusToTestCase < ActiveRecord::Migration
  def change
    add_column :test_cases, :status, :string
  end
end
