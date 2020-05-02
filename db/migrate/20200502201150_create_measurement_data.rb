class CreateMeasurementData < ActiveRecord::Migration[6.0]
  def change
    create_table :measurement_data do |t|
      t.numeric :value
      t.datetime :graph_time

      t.timestamps
    end
  end
end
