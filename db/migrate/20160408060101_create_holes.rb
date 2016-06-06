class CreateHoles < ActiveRecord::Migration
  def change
    create_table :holes do |t|
      t.string :ID
      t.datetime :date
      t.decimal :lat
      t.decimal :lng
      t.string :description

      t.timestamps null: false
    end
  end
end
