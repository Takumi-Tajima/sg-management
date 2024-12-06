class RemoveTaskFromRetrospective < ActiveRecord::Migration[7.2]
  def change
    remove_reference :retrospectives, :task, null: false, foreign_key: true
  end
end
