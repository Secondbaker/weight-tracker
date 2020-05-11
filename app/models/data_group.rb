class DataGroup < ApplicationRecord
    validates_presence_of :name
    has_many :measurement_data
    belongs_to :user
end
