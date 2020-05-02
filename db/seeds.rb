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


weight = START_WEIGHT
time = START_TIME
100.times do
    next_measurement = MeasurementData.create(value: weight)
end
