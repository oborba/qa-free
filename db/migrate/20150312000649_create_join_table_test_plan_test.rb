class CreateJoinTableTestPlanTest < ActiveRecord::Migration
  def change
    create_join_table :test_plans, :tests do |t|
       t.index [:test_plan_id, :test_id]
       t.index [:test_id, :test_plan_id]
    end
  end
end
