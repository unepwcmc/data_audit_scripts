class CreateImportanceLevels < ActiveRecord::Migration
  def change
    create_table :importance_levels do |t|
      t.string :name

      t.timestamps
    end
  end
end
