require 'httparty'

require 'RoadAR/synthesizer/client/entities/synth_job'
require 'RoadAR/synthesizer/client/repositories/repository'
require 'RoadAR/synthesizer/client/exceptions/remote_error'

module RoadAR
  module Synthesizer
    module Client
      module Repositories
        class SynthJobRepository < Repository
          entity RoadAR::Synthesizer::Client::Entities::SynthJob
          url 'jobs'
        end
      end
    end
  end
end
