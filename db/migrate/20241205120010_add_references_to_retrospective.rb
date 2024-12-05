class AddReferencesToRetrospective < ActiveRecord::Migration[7.2]
  def change
    add_reference :retrospectives, :fact, null: false, foreign_key: true
  end
end
