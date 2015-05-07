class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.integer :programme_id
      t.integer :metadata_author_id
      t.integer :network_location_id
      t.integer :format_id
      t.integer :contact_point_id
      t.integer :source_id
      t.integer :license_id
      t.integer :use_level_id
      t.integer :importance_level_id
      t.integer :scope_id
      t.integer :legacy_id
      t.date :metadata_date
      t.string :metadata_dataset_id
      t.string :name
      t.text :abstract
      t.string :other_spatial_type
      t.string :ancillary_information
      t.text :specified_permission
      t.boolean :commercial_use
      t.boolean :priority
      t.string :priority_reasons
      t.boolean :duplication_risk
      t.text :additional_comments
      t.boolean :audit_status

      t.timestamps
    end
  end
end
