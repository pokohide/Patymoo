module GraphData
  extend ActiveSupport::Concern

  included do
    def self.graph_data ref
      self.group(ref).count
    end
  end
end
