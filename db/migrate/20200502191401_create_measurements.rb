class CreateMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :measurements do |t|
      t.numeric :value
      t.datetime :date_time
      t.text :notes

      t.timestamps
    end
  end
end
