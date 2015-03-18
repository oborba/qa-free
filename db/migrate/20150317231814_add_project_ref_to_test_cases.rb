class AddProjectRefToTestCases < ActiveRecord::Migration
  def change
    add_reference :test_cases, :project, index: true
    add_foreign_key :test_cases, :projects
  end
end
