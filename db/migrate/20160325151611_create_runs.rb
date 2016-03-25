class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.date :run_date
      t.decimal :distance
      t.decimal :pace
      t.boolean :outdoors

      t.timestamps null: false
    end
  end
end
