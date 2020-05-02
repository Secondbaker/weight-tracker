# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

START_TIME = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
START_WEIGHT = 180.0
AVERAGE_WEIGHT_CHANGE_PER_DAY = -1.0 / 7.0

MeasurementDatum.destroy_all

base_weight = START_WEIGHT
display_weight = base_weight
time = START_TIME
100.times do
    next_measurement = MeasurementDatum.create(value: display_weight, graph_time: time)
    next_time = Faker::Time.between(from: time, to: time + 24.hours)
    base_weight = base_weight + ((next_time - time)*(AVERAGE_WEIGHT_CHANGE_PER_DAY / 24 /60 /60))
    display_weight = base_weight + rand(-4.0..4.0)
    time = next_time
end
