class CreateDatasetFormats < ActiveRecord::Migration
  def change
    create_table :dataset_formats do |t|
      t.string :name

      t.timestamps
    end
  end
end
