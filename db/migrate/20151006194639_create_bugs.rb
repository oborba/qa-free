class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.string :bug_title
      t.string :bug_description

      t.timestamps null: false
    end
  end
end
