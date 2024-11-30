class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.references :daily_report, foreign_key: true
      t.string :name, null: false, default: ''
      t.integer :actual_time, null: false, default: 0

      t.timestamps
    end
  end
end
