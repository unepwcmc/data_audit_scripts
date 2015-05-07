class CreateColumnMatches < ActiveRecord::Migration
  def change
    create_table :column_matches do |t|
      t.string :model_columns
      t.string :access_columns

      t.timestamps
    end
  end
end
