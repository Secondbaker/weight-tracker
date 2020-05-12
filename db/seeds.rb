# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
verbose = true
START_TIME = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
TRACKING_DAYS = 180
START_WEIGHT = 180.0
CALORIES_PER_POUND = 3500
AVERAGE_WEIGHT_CHANGE_PER_DAY = -1.0 / 7.0
AVERAGE_WEIGHT_PERCENTAGE_CHANGE = -1.0
seed_start = Time.now
DataGroup.destroy_all
User.destroy_all

    user = User.new
    user.email = username
    user.password = password
    user.password_confirmation = password
    user.save!

    #Creating Weight Data
    if verbose
        puts "Creating Weight Group"
    end
    weight_group = user.data_groups.create(name: "Weight", unit: Measurement::Unit[:pounds])

    if verbose
        puts "Creating Waist Circumference Group"
    end
    waist_circumference_group = user.data_groups.create(name: "Waist Circumference", unit: Measurement::Unit[:inches])

    base_weight = start_weight
    display_weight = base_weight
    base_waist_size = START_WAIST_SIZE
    display_waist_size = base_waist_size
    time = START_TIME
    
    if verbose
        puts "Creating weight data"
    end
    datum_counter = 1
    until (time - START_TIME)  >= SIX_MONTHS do
        if verbose 
            puts "Weight Datum #" + datum_counter.to_s
        end
        next_measurement = weight_group.measurement_data.create(value: display_weight, graph_time: time)
        next_measurement = waist_circumference_group.measurement_data.create(value: display_waist_size, graph_time: time)
        next_time = Faker::Time.between(from: time, to: time + 24.hours)
        base_weight = base_weight + ((next_time - time)*(base_weight * AVERAGE_WEIGHT_PERCENTAGE_CHANGE / 7 / 24 /60 /60 / 100))
        display_weight = base_weight + rand(-4.0..4.0)
        base_waist_size = base_weight * START_WAIST_SIZE / START_WEIGHT
        display_waist_size = base_waist_size + rand(-0.25..0.25)
        time = next_time
        datum_counter +=1
    end

    
end

puts 'Completed in ' + (Time.now - seed_start).to_s + ' seconds'