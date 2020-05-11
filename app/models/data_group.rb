class DataGroup < ApplicationRecord
    validates_presence_of :name
    has_many :measurement_data, dependent: :destroy
    belongs_to :user
end
