class ChangeNames < ActiveRecord::Migration
  def change
  	rename_table :tests, :test_cases	
  end
end
