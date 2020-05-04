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
DataGroup.destroy_all
User.destroy_all

#Creating User 1
username = 'test1@test.com'
password = 'password'
puts "Creating user " + username
puts "With password " + password
first_user = User.new
first_user.email = username
first_user.password = password
first_user.password_confirmation = password
first_user.save!

#Creating User 2
username = 'test2@test.com'
password = 'password'
puts "Creating user " + username
puts "With password " + password
second_user = User.new
second_user.email = username
second_user.password = password
second_user.password_confirmation = password
second_user.save!

#Creating Weight Data
puts "Creating Weight Group"
weight_group = first_user.data_groups.create(name: "Weight", unit: Measurement::Unit[:pounds])

base_weight = START_WEIGHT
display_weight = base_weight
time = START_TIME
datum_counter = 1
puts "Creating Data"
until (time - START_TIME)  >= 60 * 60 * 24 * 365 do
    puts "Datum #" + datum_counter.to_s
    next_measurement = weight_group.measurement_data.create(value: display_weight, graph_time: time)
    next_time = Faker::Time.between(from: time, to: time + 24.hours)
    base_weight = base_weight + ((next_time - time)*(AVERAGE_WEIGHT_CHANGE_PER_DAY / 24 /60 /60))
    display_weight = base_weight + rand(-4.0..4.0)
    time = next_time
    datum_counter += 1
end

#Creating Weight Data
puts "Creating Weight Group"
weight_group = second_user.data_groups.create(name: "Weight", unit: Measurement::Unit[:pounds])

base_weight = START_WEIGHT
display_weight = base_weight
time = START_TIME
datum_counter = 1
puts "Creating Data"
until (time - START_TIME)  >= 60 * 60 * 24 * 365 do
    puts "Datum #" + datum_counter.to_s
    next_measurement = weight_group.measurement_data.create(value: display_weight, graph_time: time)
    next_time = Faker::Time.between(from: time, to: time + 24.hours)
    base_weight = base_weight + ((next_time - time)*(AVERAGE_WEIGHT_CHANGE_PER_DAY / 24 /60 /60))
    display_weight = base_weight + rand(-4.0..4.0)
    time = next_time
    datum_counter += 1
end
