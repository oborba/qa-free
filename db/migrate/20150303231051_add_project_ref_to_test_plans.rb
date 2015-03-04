class AddProjectRefToTestPlans < ActiveRecord::Migration
  def change
    add_reference :test_plans, :project, index: true
    add_foreign_key :test_plans, :projects
  end
end
