class CreateDatasetScopes < ActiveRecord::Migration
  def change
    create_table :dataset_scopes do |t|
      t.string :name

      t.timestamps
    end
  end
end
