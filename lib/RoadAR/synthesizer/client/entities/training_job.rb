require 'RoadAR/synthesizer/client/entities/entity'

module RoadAR
  module Synthesizer
    module Client
      module Entities
        class TrainingJob
          include RoadAR::Synthesizer::Client::Entities::Entity
          attr_reader :id, :training_set_url, :testing_set_url, :negative_set_url, :status, :logs, :output_url
        end
      end
    end
  end
end
