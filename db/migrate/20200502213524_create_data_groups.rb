class CreateDataGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :data_groups do |t|
      t.string :name
      t.string :unit

      t.timestamps
    end
  end
end
