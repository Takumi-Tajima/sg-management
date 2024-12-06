class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.references :fact, null: false, foreign_key: true
      t.string :role
      t.string :content, null: false, default: ''

      t.timestamps
    end
  end
end
