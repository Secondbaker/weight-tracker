class AddDataGroupReferenceToMeasurementData < ActiveRecord::Migration[6.0]
  def change
    add_reference :measurement_data, :data_group, null: false, foreign_key: true
  end
end
