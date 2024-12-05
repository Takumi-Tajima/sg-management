class CreateFacts < ActiveRecord::Migration[7.2]
  def change
    create_table :facts do |t|
      t.references :task, null: false, foreign_key: true
      t.string :title, null: false, default: ''
      t.string :content, null: false, default: ''

      t.timestamps
    end
  end
end
