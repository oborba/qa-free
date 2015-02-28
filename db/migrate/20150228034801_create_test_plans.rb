class CreateTestPlans < ActiveRecord::Migration
  def change
    create_table :test_plans do |t|
      t.string :test_plan_name
      t.text :test_plan_description

      t.timestamps null: false
    end
  end
end
