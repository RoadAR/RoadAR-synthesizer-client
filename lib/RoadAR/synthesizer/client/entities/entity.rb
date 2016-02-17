module RoadAR
  module Synthesizer
    module Client
      module Entities
        module Entity
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
