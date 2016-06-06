class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.references :hole, index: true, foreign_key: true
      t.integer :from
      t.integer :to
      t.text :rock_type
      t.integer :discharge
      t.text :gold
      t.text :notes

      t.timestamps null: false
    end
  end
end
