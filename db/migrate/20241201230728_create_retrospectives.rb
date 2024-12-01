class CreateRetrospectives < ActiveRecord::Migration[7.2]
  def change
    create_table :retrospectives do |t|
      t.references :task, null: false, foreign_key: true
      t.string :fact, null: false, default: ''
      t.string :fact_detail, null: false, default: ''
      t.string :potential, null: false, default: ''
      t.string :try, null: false, default: ''

      t.timestamps
    end
  end
end
