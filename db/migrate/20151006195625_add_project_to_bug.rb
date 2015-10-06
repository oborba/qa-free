class AddProjectToBug < ActiveRecord::Migration
  def change
    add_reference :bugs, :project, index: true
    add_foreign_key :bugs, :projects
  end
end
