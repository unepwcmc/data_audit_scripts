class CreateUseLevels < ActiveRecord::Migration
  def change
    create_table :use_levels do |t|
      t.string :name

      t.timestamps
    end
  end
end
