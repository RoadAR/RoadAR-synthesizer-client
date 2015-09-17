require 'singleton'

module RoadAR
  module Synthesizer
    module Client
      module Entities
        class Job
          attr_reader :id, :input_url, :status, :output_url, :logs

          def initialize(job_json)
            job_json.each do |k, v|
              instance_variable_set("@#{k}", v)
              define_singleton_method k do
                instance_variable_get("@#{k}")
              end
            end
          end

          def success?
            status == 'success' && !output_url.nil? && output_url.length > 0
          end
        end
      end
    end
  end
end
