class MeasurementDatum < ApplicationRecord
    include Comparable
    before_save :set_initial_graph_time

    belongs_to :data_group
    
    def set_initial_graph_time
        unless self.graph_time
            self.graph_time = self.created_at
        end
    end

    def create(args)
        super.create(args)
        unless self.graph_time
            self.graph_time = self.created_at
        end
        self.save
    end

    def <=>(other)
        self.value <=> other.value
    end
end
