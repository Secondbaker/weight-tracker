class MeasurementDatum < ApplicationRecord
    before_save :set_initial_graph_time

    def set_initial_graph_time
        unless self.graph_time
            self.graph_time = self.created_at
        end
    end
end
