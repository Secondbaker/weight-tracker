class DataGroup < ApplicationRecord
    has_many :measurement_data
    belongs_to :user
end
