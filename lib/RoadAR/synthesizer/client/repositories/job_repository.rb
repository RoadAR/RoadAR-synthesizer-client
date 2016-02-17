require 'httparty'

require 'RoadAR/synthesizer/client/entities/synth_job'
require 'RoadAR/synthesizer/client/exceptions/remote_error'

module RoadAR
  module Synthesizer
    module Client
      module Repositories
        class JobRepository
          include Singleton

          class << self
            [:all, :create, :find].each do |method|
              define_method(method) do |*args|
                instance.send(method, *args)
              end
            end
          end

          def all
            get("#{base_url}/jobs.json").map do |job_json|
              wrap(job_json)
            end
          end

          def create(params)
            wrap(post(base_url + '/jobs.json', params))
          end

          def find(id)
            wrap(get("#{base_url}/jobs/#{id}.json"))
          end

          private

          def wrap(entity)
            RoadAR::Synthesizer::Client::Entities::Job.new(entity)
          end

          def base_url
            @base_url ||= RoadAR::Synthesizer::Config.instance.url
          end

          def token
            @token ||= RoadAR::Synthesizer::Config.instance.token
          end

          def get(url)
            res = HTTParty.get(url, query: { token: token })
            unless res.success?
              raise RoadAR::Synthesizer::Client::Exceptions::RemoteError.new(res.parsed_response)
            end
            res
          end

          def post(url, **params)
            res = HTTParty.post(url, body: { job: params }, query: { token: token })
            unless res.success?
              raise RoadAR::Synthesizer::Client::Exceptions::RemoteError.new(res.parsed_response)
            end
            res
          end
        end
      end
    end
  end
end
