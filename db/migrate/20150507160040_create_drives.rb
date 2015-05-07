class CreateDrives < ActiveRecord::Migration
  def change
    create_table :drives do |t|
      t.string :name

      t.timestamps
    end
  end
end
