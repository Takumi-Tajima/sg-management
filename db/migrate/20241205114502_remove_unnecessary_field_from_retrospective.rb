class RemoveUnnecessaryFieldFromRetrospective < ActiveRecord::Migration[7.2]
  def change
    remove_column :retrospectives, :fact, :string
    remove_column :retrospectives, :fact_detail, :string
  end
end
