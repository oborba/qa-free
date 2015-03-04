class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.timestamps null: false
      t.string :title
      t.string :description
      t.string :criticality
      t.integer :time

    end
  end
end
