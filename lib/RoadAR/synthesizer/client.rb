require 'RoadAR/synthesizer/client/version'
require 'RoadAR/synthesizer/client/config'
require 'RoadAR/synthesizer/client/repositories/job_repository'

module RoadAR
  module Synthesizer
    module Client
      def self.setup
        yield RoadAR::Synthesizer::Config.instance
      end
    end
  end
end
