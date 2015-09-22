require 'httparty'

require 'RoadAR/synthesizer/client/entities/job'

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
            HTTParty.get(url, query: { token: token })
          end

          def post(url, **params)
            HTTParty.post(url, body: { job: params }, query: { token: token })
          end

        end
      end
    end
  end
end
