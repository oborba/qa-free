class CreateJoinTableTestCaseBug < ActiveRecord::Migration
  def change
    create_join_table :test_cases, :bugs do |t|
      # t.index [:test_case_id, :bug_id]
      # t.index [:bug_id, :test_case_id]
    end
  end
end
