class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|

      t.timestamps null: false
      t.string :name
      t.text :description
    end
  end
end
