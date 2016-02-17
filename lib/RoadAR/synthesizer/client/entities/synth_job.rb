require 'RoadAR/synthesizer/client/entities/entity'

module RoadAR
  module Synthesizer
    module Client
      module Entities
        class SynthJob
          include RoadAR::Synthesizer::Client::Entities::Entity
          attr_reader :id, :input_url, :status, :output_url, :logs
        end
      end
    end
  end
end
