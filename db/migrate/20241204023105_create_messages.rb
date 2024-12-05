class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.references :chat, null: false, foreign_key: true
      t.integer :role
      t.string :content, null: false, default: ''

      t.timestamps
    end
  end
end
