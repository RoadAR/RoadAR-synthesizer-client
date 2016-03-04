require 'httparty'

require 'RoadAR/synthesizer/client/entities/training_job'
require 'RoadAR/synthesizer/client/repositories/repository'
require 'RoadAR/synthesizer/client/exceptions/remote_error'

module RoadAR
  module Synthesizer
    module Client
      module Repositories
        class TrainingJobRepository < Repository
          entity RoadAR::Synthesizer::Client::Entities::TrainingJob
          url 'training_jobs'
        end
      end
    end
  end
end
