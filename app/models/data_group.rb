class DataGroup < ApplicationRecord
    validates_presence_of :name
    has_many :measurement_data, dependent: :destroy
    belongs_to :user

    def lowest
        self.measurement_data.min
    end
    def highest
        self.measurement_data.max
    end
    def graph_min
        (self.lowest.value - (self.highest.value - self.lowest.value) * 0.05).floor
    end
    def graph_max
        (self.highest.value + (self.highest.value - self.lowest.value) * 0.05).ceil
    end
    def rolling_average(time_limit:integer)
        averages = []
        measurements = measurement_data.order(:graph_time)
        start_index = 0
        stop_index = 1
        measurements.each do |measurement_datum|
            averages.push({value: measurement_datum.value, graph_time: measurement_datum.graph_time})
        end
        return averages
    end

    private
    def average_measurement_datum_value(values)
        result = 0
        sum = 0
        values.each do |value|
            sum += value
        end
        result = sum / value.length
    end
end
