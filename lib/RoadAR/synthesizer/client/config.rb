require 'singleton'

module RoadAR
  module Synthesizer
    class Config
      include Singleton

      attr_accessor :url, :token

    end
  end
end
