class CreateDrillLogs < ActiveRecord::Migration
  def change
    create_table :drill_logs do |t|
      t.references :hole, index: true, foreign_key: true
      t.integer :from
      t.integer :to
      t.integer :num_pails
      t.text :rock_type

      t.timestamps null: false
    end
  end
end
