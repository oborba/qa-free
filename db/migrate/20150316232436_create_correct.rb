class CreateCorrect < ActiveRecord::Migration
  def change
    create_join_table :test_plans, :test_cases do |t|
    	t.index [:test_plan_id, :test_case_id]
    	t.index [:test_case_id, :test_plan_id]
  	end
  end
end
