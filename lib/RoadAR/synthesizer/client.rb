require 'RoadAR/synthesizer/client/version'
require 'RoadAR/synthesizer/client/config'
require 'RoadAR/synthesizer/client/repositories/synth_job_repository'
require 'RoadAR/synthesizer/client/repositories/training_job_repository'

module RoadAR
  module Synthesizer
    module Client
      def self.setup
        yield RoadAR::Synthesizer::Config.instance
      end
    end
  end
end
